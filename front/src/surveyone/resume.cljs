(ns surveyone.resume
  (:require [rum.core :as rum]
            [surveyone.components :as comp]
            [surveyone.router :as r]
            [surveyone.http :as http]))

(defn fetch-reports [tech-state]
  (swap! tech-state assoc :loading-data? true)
  (http/request :get
                (str (:base-url @tech-state) "/report?registry=" (:registry @tech-state) "&reports=rep2,cluster")
                nil
                {:success (fn [body]
                            (doseq [[k v] (js->clj body)
                                    :let [vl (js->clj v)]]
                              (swap! tech-state assoc-in [:reports k] vl)))
                 :error   (fn [])})
  (swap! tech-state assoc :loading-data? false))

#_(rum/defc report1-page [tech-state]
  (let [ts @tech-state
        report (get ts [:reports "rep1"])
        cnt (get ts [:reports "cnt"])
        _ (println (get ts [:reports "cnt"]))]
    [:div.row
     [:div.col-md-12
      [:h3 "Средние показатели"]
      [:p "пройдено тестов: " cnt]
      [:table.table.table-hover
       [:thead
        [:tr
         [:th {:scope "col"} "Изображение"]
         [:th {:scope "col"} "№"]
         [:th {:scope "col"} "Нажим"]
         [:th {:scope "col"} "Четкость линии"]
         [:th {:scope "col"} "Толщина линии"]
         [:th {:scope "col"} "Гибкость линии"]
         [:th {:scope "col"} "Частота штриха"]
         [:th {:scope "col"} "Градации тона"]
         [:th {:scope "col"} "Цветовой контраст"]]]
       [:tbody
        (for [rep (reverse report)]
          [:tr {:key (:image rep)}
           [:td
            [:a
             {:target "_blank"
              :href   (str (:image-base-url ts) "/" (:image rep))}
             (:image rep)]]
           [:td (:cnt rep)]
           [:td (get-in rep [:json_object_agg :pressure])]
           [:td (get-in rep [:json_object_agg :definition])]
           [:td (get-in rep [:json_object_agg :thickness])]
           [:td (get-in rep [:json_object_agg :flexibility])]
           [:td (get-in rep [:json_object_agg :stroke-frequency])]
           [:td (get-in rep [:json_object_agg :gradation-tone])]
           [:td (get-in rep [:json_object_agg :contrast])]])]]]]))

(def params-kv
  {:contrast         "Контраст"
   :stroke-frequency "Частота штриха"
   :gradation-tone   "Градации тона"
   :definition       "Четкость линии"
   :thickness        "Толщина линии"
   :flexibility      "Гибкость линии"
   :pressure         "Нижим"})

(defn- prepare-report2 [report2]
  (reduce (fn [acc val]
            (let [img (:image val)
                  u (:json_object_agg val)
                  m (:json_object_agg (first (filter #(= (:image %) img) (:average report2))))]
              (conj acc {:image        img
                         :byrespondent u
                         :average      m})))
          []
          (:byrespondent report2)))

(rum/defc list-results [report]
  [:dl.row
   (for [r (get-in report [:byrespondent])
         :let [p (get-in params-kv [(key r)])
               rv (val r)
               av (second (first (filter (fn [[k v]] (= k (key r))) (get-in report [:average]))))]]
     [[:dt.col-sm-6 {:key p} p]
      [:dd.col-sm-6
       (str rv
            (when-not (= rv av)
              (str " (среднее: " av ")")))]])])

(rum/defc report2-page
  [tech-state]
  (let [reports (prepare-report2 (get-in @tech-state [:reports "rep2"]))]
    [:div.row
     (for [rep reports
           :let [img (:image rep)
                 img-src (str (:image-base-url @tech-state) "/" img)]]
       [:div.col
        [:div.row
         [:div.col-sm-3.text-center
          (comp/image img-src img {:style {:height         "300px"
                                           :padding-bottom "4px"}})]
         [:div.col-sm-9.text-left
          (list-results rep)]]])]))

(def image->color
  [["DCIM_0093" "rgb(255,0,0)"]
   ["DCIM_0092" "rgb(255,0,0)"]
   ["DCIM_0091" "rgb(255,0,0)"]
   ["DCIM_0090" "rgb(255,0,0)"]
   ["DCIM_0089" "rgb(255,0,0)"]
   ["DCIM_0088" "rgb(255,0,0)"]
   ["DCIM_0087" "rgb(255,0,0)"]
   ["DCIM_0086" "rgb(255,0,0)"]
   ["DCIM_0134" "rgb(255,192,0)"]
   ["DCIM_0135" "rgb(255,192,0)"]
   ["DCIM_0136" "rgb(255,192,0)"]
   ["DCIM_0137" "rgb(255,192,0)"]
   ["DCIM_0138" "rgb(255,192,0)"]
   ["DCIM_0139" "rgb(255,192,0)"]
   ["DCIM_0128" "rgb(255,255,0)"]
   ["DCIM_0129" "rgb(255,255,0)"]
   ["DCIM_0130" "rgb(255,255,0)"]
   ["DCIM_0131" "rgb(255,255,0)"]
   ["DCIM_0132" "rgb(255,255,0)"]
   ["DCIM_0133" "rgb(255,255,0)"]
   ["DCIM_0115" "rgb(146,208,80)"]
   ["DCIM_0116" "rgb(146,208,80)"]
   ["DCIM_0117" "rgb(146,208,80)"]
   ["DCIM_0118" "rgb(146,208,80)"]
   ["DCIM_0119" "rgb(146,208,80)"]
   ["DCIM_0120" "rgb(146,208,80)"]
   ["DCIM_0085" "rgb(146,208,80)"]
   ["DCIM_0084" "rgb(146,208,80)"]
   ["DCIM_0083" "rgb(146,208,80)"]
   ["DCIM_0082" "rgb(146,208,80)"]
   ["DCIM_0081" "rgb(146,208,80)"]
   ["DCIM_0080" "rgb(146,208,80)"]
   ["DCIM_0074" "rgb(0,176,80)"]
   ["DCIM_0073" "rgb(0,176,80)"]
   ["DCIM_0072" "rgb(0,176,80)"]
   ["DCIM_0071" "rgb(0,176,80)"]
   ["DCIM_0070" "rgb(0,176,80)"]
   ["DCIM_0069" "rgb(0,176,80)"]
   ["DCIM_0008" "rgb(0,176,80)"]
   ["DCIM_0011" "rgb(0,176,80)"]
   ["DCIM_0109" "rgb(0,176,240)"]
   ["DCIM_0110" "rgb(0,176,240)"]
   ["DCIM_0111" "rgb(0,176,240)"]
   ["DCIM_0112" "rgb(0,176,240)"]
   ["DCIM_0113" "rgb(0,176,240)"]
   ["DCIM_0114" "rgb(0,176,240)"]
   ["DCIM_0094" "rgb(0,176,240)"]
   ["DCIM_0043" "rgb(0,176,240)"]
   ["DCIM_0140" "rgb(0,112,192)"]
   ["DCIM_0141" "rgb(0,112,192)"]
   ["DCIM_0142" "rgb(0,112,192)"]
   ["DCIM_0143" "rgb(0,112,192)"]
   ["DCIM_0144" "rgb(0,112,192)"]
   ["DCIM_0145" "rgb(0,112,192)"]
   ["DCIM_0042" "rgb(0,32,96)"]
   ["DCIM_0146" "rgb(0,32,96)"]
   ["DCIM_0147" "rgb(0,32,96)"]
   ["DCIM_0148" "rgb(0,32,96)"]
   ["DCIM_0149" "rgb(0,32,96)"]
   ["DCIM_0150" "rgb(0,32,96)"]
   ["DCIM_0151" "rgb(0,32,96)"]
   ["DCIM_0041" "rgb(0,32,96)"]
   ["DCIM_0040" "rgb(0,32,96)"]
   ["DCIM_0039" "rgb(0,32,96)"]
   ["DCIM_0038" "rgb(0,32,96)"]
   ["DCIM_0037" "rgb(0,32,96)"]
   ["DCIM_0068" "rgb(112,48,160)"]
   ["DCIM_0067" "rgb(112,48,160)"]
   ["DCIM_0066" "rgb(112,48,160)"]
   ["DCIM_0065" "rgb(112,48,160)"]
   ["DCIM_0064" "rgb(112,48,160)"]
   ["DCIM_0063" "rgb(112,48,160)"]
   ["DCIM_0062" "rgb(112,48,160)"]
   ["DCIM_0061" "rgb(128,128,128)"]
   ["DCIM_0060" "rgb(128,128,128)"]
   ["DCIM_0059" "rgb(128,128,128)"]
   ["DCIM_0058" "rgb(128,128,128)"]
   ["DCIM_0056" "rgb(128,128,128)"]
   ["DCIM_0055" "rgb(128,128,128)"]
   ["DCIM_0054" "rgb(128,128,128)"]
   ["DCIM_0053" "rgb(128,128,128)"]
   ["DCIM_0052" "rgb(128,128,128)"]
   ["DCIM_0051" "rgb(128,128,128)"]
   ["DCIM_0050" "rgb(128,128,128)"]
   ["DCIM_0049" "rgb(128,128,128)"]
   ["DCIM_0036" "rgb(13,13,13)"]
   ["DCIM_0035" "rgb(13,13,13)"]
   ["DCIM_0034" "rgb(13,13,13)"]
   ["DCIM_0033" "rgb(13,13,13)"]
   ["DCIM_0032" "rgb(13,13,13)"]
   ["DCIM_0031" "rgb(13,13,13)"]
   ["DCIM_0030" "rgb(13,13,13)"]
   ["DCIM_0029" "rgb(13,13,13)"]
   ["DCIM_0028" "rgb(13,13,13)"]
   ["DCIM_0027" "rgb(13,13,13)"]
   ["DCIM_0012" "rgb(148,138,84)"]
   ["DCIM_0014" "rgb(148,138,84)"]
   ["DCIM_0015" "rgb(148,138,84)"]
   ["DCIM_0016" "rgb(148,138,84)"]
   ["DCIM_0017" "rgb(148,138,84)"]
   ["DCIM_0018" "rgb(148,138,84)"]
   ["DCIM_0019" "rgb(148,138,84)"]
   ["DCIM_0020" "rgb(148,138,84)"]
   ["DCIM_0021" "rgb(148,138,84)"]
   ["DCIM_0023" "rgb(148,138,84)"]
   ["DCIM_0022" "rgb(148,138,84)"]
   ["DCIM_0096" "rgb(148,138,84)"]
   ["DCIM_0004" "rgb(177,160,199)"]
   ["DCIM_0025" "rgb(177,160,199)"]
   ["DCIM_0024" "rgb(177,160,199)"]
   ["DCIM_0026" "rgb(177,160,199)"]
   ["DCIM_0005" "rgb(177,160,199)"]
   ["DCIM_0006" "rgb(177,160,199)"]
   ["DCIM_0007" "rgb(177,160,199)"]
   ["DCIM_0009" "rgb(177,160,199)"]
   ["DCIM_0010" "rgb(177,160,199)"]
   ["DCIM_0103" "rgb(250,191,143)"]
   ["DCIM_0104" "rgb(250,191,143)"]
   ["DCIM_0105" "rgb(250,191,143)"]
   ["DCIM_0106" "rgb(250,191,143)"]
   ["DCIM_0107" "rgb(250,191,143)"]
   ["DCIM_0108" "rgb(250,191,143)"]
   ["DCIM_0125" "rgb(255,0,255)"]
   ["DCIM_0126" "rgb(255,0,255)"]
   ["DCIM_0127" "rgb(255,0,255)"]
   ["DCIM_0047" "rgb(255,0,255)"]
   ["DCIM_0046" "rgb(255,0,255)"]
   ["DCIM_0045" "rgb(255,0,255)"]
   ["DCIM_0044" "rgb(255,0,255)"]
   ["DCIM_0121" "rgb(255,102,153)"]
   ["DCIM_0122" "rgb(255,102,153)"]
   ["DCIM_0123" "rgb(255,102,153)"]
   ["DCIM_0124" "rgb(255,102,153)"]
   ["DCIM_0095" "rgb(255,102,153)"]
   ["DCIM_0079" "rgb(255,102,153)"]
   ["DCIM_0078" "rgb(255,102,153)"]
   ["DCIM_0077" "rgb(255,102,153)"]
   ["DCIM_0076" "rgb(255,102,153)"]
   ["DCIM_0075" "rgb(255,102,153)"]
   ["DCIM_0097" "rgb(196,189,151)"]
   ["DCIM_0098" "rgb(196,189,151)"]
   ["DCIM_0099" "rgb(196,189,151)"]
   ["DCIM_0100" "rgb(196,189,151)"]
   ["DCIM_0101" "rgb(196,189,151)"]
   ["DCIM_0102" "rgb(196,189,151)"]])

(defn find-color [image]
  (or (second (first
                (filter (fn [[i c]]
                          (= i (clojure.string/replace image ".jpg" "")))
                        image->color))) "black"))

(defn prepare-cluster-items [nodes]
  (sort-by :color (mapv (fn [i] {:color (find-color i) :image i}) nodes)))

(rum/defc cluster-node [nodes]
  [:div.row
   [:div.card.cluster-node
    [:div.card-body.row
     (for [item (prepare-cluster-items nodes)]
       [:div.cluster-item
        {:style {:background-color (:color item)}
         :key   (:image item)}
        [:span ""]])]]])

(rum/defc cluster-view [report]
  (let [date (:created_at report)
        clusters (sort-by count > (js->clj (js/JSON.parse (:result report))))]
    [:div.row
     [:div.col.text-center
      (for [cl clusters]
        (cluster-node cl))]]))

(rum/defc resume-page <
  rum/reactive
  {:did-mount (fn [state]
                (let [[ts] (:rum/args state)]
                  (fetch-reports ts))
                state)}
  [tech-state]
  (let [ts (rum/react tech-state)]
    [:div.col
     [:div.row
      [:div.col.text-right
       [:button.btn.btn-danger
        {:on-click (fn [e] (r/navigate! :finish))
         :style    {:margin-top "25px"}}
        "Завершить"]]]
       [:hr]
       [:div.row
        [:div.col
         [:h3 "Ваши результаты в сравнении с результатами других пользователей"]
         (report2-page tech-state)
         [:h3 "Кластерный анализ"]
         (cluster-view (get-in ts [:reports "cluster"]))]]]))