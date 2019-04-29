(ns surveyone.components
  (:require [rum.core :as rum]
            [cljsjs.c3]))

(rum/defc image [url title & [style]]
  [:a {:target "_blank"
       :href   url}
   [:img.img-thumbnail
    {:src   url
     :style (merge {:padding "inherit"} style)
     :alt   title}]])

(rum/defc chart-donut <
  rum/reactive
  {:did-mount (fn [state]
                (let [[chat-info title] (:rum/args state)
                      div (js/ReactDOM.findDOMNode (:rum/react-component state))
                      info (clj->js {:bindto div
                                     :donut  {:title title}
                                     :data   chat-info})]
                  (js/c3.generate info))
                state)}
  [chat-info title]
  [:div])

(rum/defc radio-box < rum/reactive
  [title key on-change & [params]]
  (let [id (str title "-" key)]
    [:div.form-check
     {:class (:class params)}
     [:input.form-check-input
      {:type      "radio"
       :name      key
       ;:disabled (:disabled params false)
       :id        id
       :on-change #(on-change)}]
     [:label.form-check-label
      {:for id}
      title]]))

;(rum/defc check-box < rum/reactive
;  [title key on-change & [params]]
;  (let [id (str title "-" key)]
;    [:div.form-check
;     {:class (:class params)}
;     [:input.form-check-input
;      {:type "checkbox"
;       :name key
;       :disabled (:disabled params false)
;       :id   id
;       :on-change #(on-change key)}]
;     [:label.form-check-label
;      {:for id}
;      title]]))

(rum/defc select-box < rum/reactive
  [value options on-change & [params]]
  [:select.form-control.placeholder
   (merge {:value     value
           :type      "text"
           :on-change #(on-change (.-value (.-target %)))}
          params)
   [:option.disabled]
   (for [[k v] options]
     [:option {:key   k
               :value k} v])])

(rum/defc input-box < rum/reactive
  [value on-change & [params]]
  [:input.form-control
   (merge {:on-change   #(on-change (.-value (.-target %)))
           :type        "text"
           :value       value
           :placeholder "Введите значение"}
          params)])
