;; -*- emacs-lisp -*-
(setq src "/home/torstein/src")
(setq jdibug-connect-hosts (quote ("localhost:5005"))
      jdibug-use-jdee-source-paths nil
      jdibug-source-paths
      (list
       (concat src "/content-engine/client/client-api/src/main/java")
       (concat src "/content-engine/client/client-core/src/main/java")
       (concat src "/content-engine/common/common-jersey/src/main/java")
       (concat src "/content-engine/common/common-nursery-jersey/src/main/java")
       (concat src "/content-engine/common/common-nursery-servlet/src/main/java")
       (concat src "/content-engine/common/common-nursery/src/main/java")
       (concat src "/content-engine/common/common-schedule/src/main/java")
       (concat src "/content-engine/common/common-util/src/main/java")
       (concat src "/content-engine/common/common-vdf/src/main/java")
       (concat src "/content-engine/engine/engine-api/src/main/java")
       (concat src "/content-engine/engine/engine-classification/classification-backends/database/src/main/java")
       (concat src "/content-engine/engine/engine-classification/classification-core/src/main/java")
       (concat src "/content-engine/engine/engine-classification/classification-syndication/src/main/java")
       (concat src "/content-engine/engine/engine-core/src/main/java")
       (concat src "/content-engine/engine/engine-indexer-webservice/src/main/java")
       (concat src "/content-engine/engine/engine-jersey/src/main/java")
       (concat src "/content-engine/engine/engine-presentation/src/main/java")
       (concat src "/content-engine/engine/engine-resolver/src/main/java")
       (concat src "/content-engine/engine/engine-search/src/main/java")
       (concat src "/content-engine/engine/engine-servletsupport/src/main/java")
       (concat src "/content-engine/engine/engine-syndication/src/main/java")
       (concat src "/content-engine/engine/engine-taglib/src/main/java")
       (concat src "/content-engine/engine/engine-upgrade/src/main/java")
       (concat src "/content-engine/engine/engine-webservice-api/src/main/java")
       (concat src "/content-engine/engine/engine-webservice/src/main/java")
       (concat src "/content-engine/engine/phoenix/phoenix-admin/src/main/java")
       (concat src "/content-engine/engine/phoenix/phoenix-core/src/main/java")
       (concat src "/content-engine/indexer/indexer-core/src/main/java")
       (concat src "/content-engine/indexer/indexer-webapp/src/main/java")
       (concat src "/content-engine/model-core/src/main/java")
       (concat src "/content-engine/studio-webstart/studio-webstart-bootstrap/src/main/java")
       (concat src "/content-engine/studio-webstart/studio-webstart-dist/src/main/java")
       (concat src "/content-engine/studio-webstart/studio-webstart-engine/src/main/java")
       (concat src "/content-engine/studio-webstart/studio-webstart-getdown/src/main/java")
       (concat src "/content-engine/studio/studio-api/src/main/java")
       (concat src "/content-engine/studio/studio-core/src/main/java")
       (concat src "/content-engine/studio/studio-plugin-demo/src/main/java")
       (concat src "/content-engine/studio/studio-sandbox/src/main/java")
       (concat src "/content-engine/studio/studio-swing/src/main/java")
       "/usr/lib/jvm/jdk-8-oracle-x64/src"
       "/usr/local/src/apache-tomcat-7.0.62-src/java"
       )
)

(add-to-list 'load-path "/usr/local/src/jdibug/build/jdibug-0.7")
(require 'jdibug)
(require 'jdibug-ui)

(defun my-jdibug-mode-hook ()
  ;; IDEA style debug short cuts
  (define-key c-mode-base-map [ (f7) ] 'jdibug-step-into)
  (define-key c-mode-base-map [ (f8) ] 'jdibug-step-over)
  (define-key c-mode-base-map [ (f9) ] 'jdibug-step-out)
  (define-key c-mode-base-map [ (f10) ] 'jdibug-resume)
  (global-set-key "\C-\M-b" 'jdibug-connect)
)
(add-hook 'c-mode-common-hook 'my-jdibug-mode-hook)