(ns surveyone.storage
  (:require [alandipert.storage-atom :refer [local-storage]]))

(def store (local-storage (atom {}) :metexpert))