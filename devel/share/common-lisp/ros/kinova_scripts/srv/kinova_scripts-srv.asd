
(cl:in-package :asdf)

(defsystem "kinova_scripts-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Joint_angles" :depends-on ("_package_Joint_angles"))
    (:file "_package_Joint_angles" :depends-on ("_package"))
    (:file "New_pose" :depends-on ("_package_New_pose"))
    (:file "_package_New_pose" :depends-on ("_package"))
  ))