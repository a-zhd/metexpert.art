(ns surveyone.survey
  (:require [rum.core :as rum]
            [surveyone.http :as http]
            [surveyone.components :as comp]
            [surveyone.router :as r]))

(def help-text1
  [:div
   [:p "Для оценивания за один раз предлагается два изображения, однако тест можно проходить несколько раз и каждый раз,
    изображения, подлежащие оцениванию, будут другими. Всего в исследовании участвует 145 изображений, принадлежащих
    17 авторам."]
   ])

(def help-text2
  "На экране монитора представлено три рисунка. Левое и правое изображения – эталонные и значение показателей у них\n
    равно 1 и 100 соответственно. Необходимо указать значение показателя для рисунка, расположенного в центре, относительно крайних.")

(defn- prepare-data [input image-base-url]
  (let [registry-id (get-in input [:registry :id])
        parameters (mapv (fn [prm]
                           (assoc prm
                             :param-img-max-url (str image-base-url "/" (:param-img-max prm))
                             :param-img-min-url (str image-base-url "/" (:param-img-min prm))
                             :image-url (str image-base-url "/" (:image prm))))
                         (mapcat conj
                                 (for [p (:parameters input)]
                                   (for [i (:images input)]
                                     {:id_registry   (get-in input [:registry :id])
                                      :id_parameter  (:id p)
                                      :id_image      (:id i)
                                      :value         nil
                                      :param-img-max (:max_title p)
                                      :param-img-min (:min_title p)
                                      :image         (:title i)
                                      :param-title   (:title p)}))))]
    {:registry-id registry-id :quiz parameters}))

(defn- set-value [val inc-val]
  (min (max 0 (+ val inc-val)) 100))

(defn- update-value [])

(defn prepare-answers [quiz]
  (let [answers (map #(dissoc %
                              :image-url :param-img-max-url
                              :param-img-max :param-img-min-url
                              :param-img-min :param-title :image) quiz)]
    (http/json-encode answers)))

(defn send-answers [state tech-state]
  (http/request :post
                (str (:base-url @tech-state) "/save")
                {:registry (get-in @state [:data :registry-id])
                 :answers  (prepare-answers (get-in @state [:data :quiz]))}
                {:success (fn [body]
                            (swap! tech-state assoc
                                   :report-should-update true
                                   :registry (get-in @state [:data :registry-id]))
                            (reset! state {})
                            (r/navigate! :interview))
                 :error   (fn [])}))

(defn- fetch-data [state tech-state]
  (swap! tech-state assoc :loading-data? true)
  (when (empty? (:data @state))
    (http/request :get
                  (str (:base-url @tech-state) "/get")
                  nil
                  {:success (fn [body]
                              (let [d (prepare-data body (:image-base-url @tech-state))]
                                (swap! state assoc :data d)
                                (swap! tech-state assoc-in [:interview :start-time] (.getTime (js/Date.)))))
                   :error   (fn [])}))
  (swap! tech-state assoc :loading-data? false))

(defn- save [state index value]
  (swap! state update-in [:data :quiz] (fn [qvec]
                                         (update qvec index (fn [q] (assoc q :value value))))))

(rum/defc survey-page <
  rum/reactive
  {:did-mount (fn [state]
                (let [[s ts] (:rum/args state)]
                  (fetch-data s ts))
                state)}
  [state tech-state]
  (let [s (rum/react state)
        ts (rum/react tech-state)
        quiz (get-in s [:data :quiz])
        [index current-parameter] (first (remove nil? (map-indexed (fn [index item]
                                                                     (when-not (:value item)
                                                                       [index item]))
                                                                   quiz)))
        installed-value (:installed-value ts 0)
        corrected-input? (> installed-value 0)]
    [:div.container
     [:div.row
      {:style {:margin-top "15px"}}
      [:div.col.text-center
       [:h4 help-text2]]]
     [:div.row.top-panel
      [:div.col-4
       [:h4 (str (inc index) "/" (count quiz))]]
      [:div.col-4.text-center
       [:h4 [:span.badge.badge-success installed-value]]]
      [:div.col-4.text-right
       [:button.btn.btn-outline-success
        {:on-click #(if (:helper-text ts)
                      (swap! tech-state dissoc :helper-text)
                      (swap! tech-state assoc :helper-text help-text1))}
        "Помощь"]]]
     [:hr]
     [:div.row
      [:div.col-6
       [:h4 "Показатель - " (clojure.string/lower-case (str (:param-title current-parameter)))]]
      [:div.col-sm-6.text-right
       [:button.btn.btn-outline-info.big-btn
        {:on-click #(swap! tech-state update :installed-value (fn [cur-v]
                                                                (set-value cur-v -1)))}
        "-1"]
       [:button.btn.btn-outline-info.big-btn
        {:on-click #(swap! tech-state update :installed-value (fn [cur-v]
                                                                (set-value cur-v -10)))}
        "-10"]
       [:button.btn.btn-outline-info.big-btn
        {:on-click #(swap! tech-state update :installed-value (fn [cur-v]
                                                                (set-value cur-v 10)))}
        "+10"]
       [:button.btn.btn-outline-info.big-btn
        {:on-click #(swap! tech-state update :installed-value (fn [cur-v]
                                                                (set-value cur-v 1)))}
        "+1"]
       [:button.btn.btn-danger.big-btn2
        {:on-click (fn [e]
                     (save state index installed-value)
                     (swap! tech-state dissoc :installed-value)
                     (when (= (inc index) (count quiz))
                       (do
                         (swap! tech-state assoc-in [:interview :end-time] (.getTime (js/Date.)))
                         (send-answers state tech-state))))
         :disabled (not corrected-input?)}
        "Принять результат"]]]
     [:div.row
      [:div.col-sm-4.float-left
       (comp/image (:param-img-min-url current-parameter) (:param-img-min current-parameter))]
      [:div.col-sm-4
       (comp/image (:image-url current-parameter) (:image current-parameter))]
      [:div.col-sm-4
       (comp/image (:param-img-max-url current-parameter) (:param-img-max current-parameter))]]]))
