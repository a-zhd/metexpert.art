(ns ^:figwheel-no-load metexpert.art.dev
  (:require
    [metexpert.art.core :as core]
    [devtools.core :as devtools]))

(devtools/install!)

(enable-console-print!)

(core/init!)
