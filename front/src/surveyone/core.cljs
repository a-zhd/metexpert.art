(ns surveyone.core
  (:require [rum.core :as rum]
            [surveyone.router :as r]
            [surveyone.storage :as storage]
            [surveyone.survey :as surv1]
            [surveyone.start :as start]
            [surveyone.resume :as resume]
            [surveyone.interview :as interview]
            [surveyone.finish :as finish]))

(enable-console-print!)

(println "This text is printed from src/met-expert-frontend/core.cljs. Go ahead and edit it and see reloading in action.")

;; define your app data so that it doesn't get over-written on reload
(def base-url js/base_url)
(def image-base-url js/image_base_url)
(defonce app-state storage/store)
(defonce tech-state (atom {:loading-data?  false
                           :base-url       base-url
                           :image-base-url image-base-url}))

(defn on-js-reload [])

(rum/defc error-page []
  [:div.container-fluid.alert.alert-danger
   "Page not found"])

(rum/defc helper-modal-page < rum/reactive
  [tech-state]
  (let [ts (rum/react tech-state)]
    (when-let [text (:helper-text ts)]
      [:div.container.modal-window
       [:div.row
        [:div.col
         [:div.card.help-card
          [:div.card-body
           [:div.row
            [:dic.col
             [:p text]]]
           [:div.row
            [:dic.col.text-center
             [:button.btn.btn-danger
              {:on-click #(swap! tech-state dissoc :helper-text)}
              "Закрыть"]]]]]]]])))

(rum/defc main-page < rum/reactive
  [route params]
  (let [s (rum/react tech-state)
        loading? (:loading-data? s false)]
    [:div.container
     (helper-modal-page tech-state)
     (when loading?
       [:div.row
        [:div.col.load-indication-panel.progress-bar.progress-bar-striped.progress-bar-animated]])
     [:div.row
      [:div.col-md-9
       [:h1.display-4
        {:on-click #(r/navigate! :start)}
        "Стань экспертом!"]]
      [:div.col-sm-3.text-center
       [:a
        {:href "http://urfu.ru"}
        [:img {:src    "pictures/urfu_logo.png"
               :style {:margin-top "6px"}
               :height "92px"}]]]]
     [:div.row
      (case route
        :start (start/start-page tech-state)
        :survey (surv1/survey-page app-state tech-state)
        :resume (resume/resume-page tech-state)
        :interview (interview/interview-page tech-state)
        :finish (finish/finish-page tech-state)
        (error-page))]
     [:div.row
      [:div.col.footer
       [:hr]
       [:span "Ⓒ 2018 "
        [:a {:href     ""
             :on-click #(r/navigate! :start)}
         "metexpert.art"]
        " Все права защищены."]
       [:span "metexpert.art\n                и коллектив авторов\n
                являются обладателями исключительных прав на все изображения и текстовую информацию. Использование тектов\n
                и изображений, опубликованных на сайте, возможно только с разрешения metexpert.art"]]]]))

(defn start
  [route-key params]
  (let [root-comp (.getElementById js/document "app")]
    (set! (.-style.display (.getElementById js/document "spinner")) "none")
    (rum/mount (main-page route-key params) root-comp)))

(r/start :error start)