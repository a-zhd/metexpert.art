(ns surveyone.interview
  (:require [surveyone.router :as r]
            [rum.core :as rum]
            [surveyone.http :as http]
            [surveyone.components :as comp]))

(def education
  ["Высшее"
   "Среднее специальное"
   "Начальное"
   "Нет образования"])

(def profession-types
  ["Автосервис / Автотовары"
   "Город / Власть"
   "Досуг / Развлечения / Общественное питание"
   "Интернет / Связь / Информационные технологии"
   "Коммунальные / бытовые / ритуальные услуги"
   "Компьютеры / Бытовая техника / Офисная техника"
   "Культура / Искусство / Религия"
   "Мебель / Материалы / Фурнитура"
   "Медицина / Здоровье / Красота"
   "Металлы / Топливо / Химия"
   "Оборудование / Инструмент"
   "Образование / Работа / Карьера"
   "Одежда / Обувь"
   "Охрана / Безопасность"
   "Продукты питания / Напитки"
   "Реклама / Полиграфия / СМИ"
   "Спорт / Отдых / Туризм"
   "Строительные / отделочные материалы"
   "Строительство / Недвижимость / Ремонт"
   "Текстиль / Предметы интерьера"
   "Товары для животных / Ветеринария"
   "Торговые комплексы / Спецмагазины"
   "Транспорт / Грузоперевозки"
   "Хозтовары / Канцелярия / Упаковка"
   "Электроника / Электротехника"
   "Юридические / финансовые / бизнес-услуги"])

(rum/defc interview-print-items [items]
  [:dl.row
   (for [i items]
     [[:dt.col-sm-3
       (first i)]
      [:dd.col-sm-9
       (second i)]])])

(rum/defc interview-page <
  rum/reactive
  [tech-state]
  (let [ts (rum/react tech-state)]
    [:div.col
     [:div.row
      [:div.col
       [:p.h3 "Пожалуйста, расскажите о себе"]]]
     [:hr]
     [:div.row
      [:div.col-8
       (interview-print-items [["Пол" [(comp/radio-box "Мужской"
                                                       :sex
                                                       #(swap! tech-state assoc-in [:interview :sex] :man)
                                                       {:class "form-check-inline"})
                                       (comp/radio-box "Женский"
                                                       :sex
                                                       #(swap! tech-state assoc-in [:interview :sex] :woman)
                                                       {:class "form-check-inline"})]]
                               ["Год рождения" (comp/select-box
                                                 (get-in @tech-state [:interview :age])
                                                 (mapv (fn [v] [v v]) (range 1940 2018))
                                                 #(swap! tech-state assoc-in [:interview :age] %)
                                                 {:class "form-control-sm"})]
                               ["Образование" (comp/select-box
                                                (-indexOf education (get-in @tech-state [:interview :education]))
                                                (map-indexed (fn [i v] [i v]) education)
                                                #(swap! tech-state assoc-in [:interview :education] (nth education (int %)))
                                                {:class "form-control-sm"})]
                               ["Сфера деятельности" (comp/select-box
                                                       (-indexOf profession-types (get-in @tech-state [:interview :profession]))
                                                       (map-indexed (fn [i v] [i v]) profession-types)
                                                       #(swap! tech-state assoc-in [:interview :profession] (nth profession-types (int %)))
                                                       {:class "form-control-sm"})]])]]
     [:div.col.text-right
      [:button.btn.btn-outline-success
       {:on-click (fn [e]
                    (when-let [data (:interview ts nil)]
                      (http/request :post
                                    (str (:base-url ts) "/save")
                                    {:add_info (http/json-encode data)
                                     :registry (:registry ts)}
                                    {:success (fn []
                                                (swap! tech-state dissoc :interview))
                                     :error   (fn [])}))
                    (r/navigate! :resume))}
       "Завершить!"]]]))


