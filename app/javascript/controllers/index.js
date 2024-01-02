import { application } from "controllers/application"

import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

import ToyRobotController from "./toy_robot_controller"
application.register("toy-robot", ToyRobotController)
