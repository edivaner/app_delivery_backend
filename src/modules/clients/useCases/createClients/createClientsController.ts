import { Request, Response } from "express";
import { IClientsRepository } from "modules/clients/repositories/IClientsRepository";
import { container } from "tsyringe";
import { CreateClientsCaseUse } from "./createClientsCaseUse";

class CreateClientsController {
    async handle(request: Request, response: Response) {
        const { name, username, password, telephone } = request.body;
        const createClientsCaseUse = container.resolve(CreateClientsCaseUse)
        const result = await createClientsCaseUse.execute({ name, username, password, telephone });

        return response.json(result);
    }
}

export { CreateClientsController }