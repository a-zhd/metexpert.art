(ns surveyone.router
  (:require [bide.core :as r]))

(def router
  (r/router [["/" :start]
             ["/survey" :survey]
             ["/resume" :resume]
             ["/interview" :interview]
             ["/finish" :finish]]))

(defn start [default-route page]
  (r/start! router {:default     default-route
                    :on-navigate page}))

(defn navigate! [id & params]
  (r/navigate! router id params))