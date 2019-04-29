(ns surveyone.finish
  (:require [surveyone.router :as r]
            [rum.core :as rum]
            [surveyone.http :as http]
            [surveyone.components :as comp]))

(def text
  [:div
   [:h2 "Спасибо Вам за участие!"]
   [:p "За создание рисунков, авторы проекта выражают искреннюю благодарность Льву Хабарову ("
    [:a {:href "http://kursrisowanija.ru"} "http://kursrisowanija.ru"]
    ") и ученикам его студии, а также известным профессиональным художникам Екатеринбурга - Сергею Лаушкину, Елене Гладышевой,
    Виктору Оборотистову и Владимиру Романову."]
   [:p "Отдельно хотим поблагодарить преподавателей и заведующего кафедрой полиграфии и веб-дизайна Института радиоэлектроники
      и информационных технологий УрФУ, за поддержку и предоставленную возможность реализации сложного
      междисциплинарного исследования."]])

(rum/defc finish-page <
  rum/reactive
  [tech-state]
  (let [ts (rum/react tech-state)]
    [:div.col
     [:div.row
      [:div.col.text-right
       [:button.btn.btn-outline-success
        {:on-click (fn [e] (r/navigate! :survey))
         :style    {:margin-top "25px"}}
        "Пройти с другим рисунком"]
       [:button.btn.btn-outline-success
        {:on-click (fn [e] (r/navigate! :start))
         :style    {:margin-top "25px"}}
        "В начало"]
       [:hr]
       [:div.row
        [:div.col.text-center
          text
         [:strong "Мона Лиза, автором которой является Леонардо да Винчи, вот эта!"]
         [:div
          [:img.img-thumbnail
           {:src   "pictures/monolisa3.jpg"
            :style {:height "250px"}
            :alt   ""}]]]]]]]))
