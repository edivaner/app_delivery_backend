import { Router } from "express";
import { CreateClientsController } from "./modules/clients/useCases/createClients/createClientsController";

const router = Router();

const createClientsController = new CreateClientsController();

router.post("/client/", createClientsController.handle);

export { router };