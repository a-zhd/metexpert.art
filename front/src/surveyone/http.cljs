(ns surveyone.http
  (:require-macros [cljs.core.async.macros :refer [go]])
  (:require [cljs-http.client :as http-client]
            [cljs.core.async :refer [<!]]))

(defn request [method url kv-body callback & [params]]
  (go
    (let [def-params {:with-credentials? false :form-params kv-body}
          resp (case method
                 :get (<! (http-client/get url (merge def-params params)))
                 :post (<! (http-client/post url (merge def-params params))))
          status (:status resp)]
      (if (= status 200)
        ((:success callback) (:body resp))
        (do
          (.error js/console "Response recive with error" "Have status: " status)
          (:error callback))))))

(defn json-encode
  "JSON encode `x` into a String."
  [x]
  (js/JSON.stringify (clj->js x)))