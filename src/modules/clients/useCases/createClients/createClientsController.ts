import { Request, Response } from "express";
import { CreateClientsCaseUse } from "./createClientsCaseUse";

class CreateClientsController {
    async handle(request: Request, response: Response) {
        const { name } = request.body;
        const { username } = request.body;
        const { password } = request.body;

        const createClientsCaseUse = new CreateClientsCaseUse();
        const result = await createClientsCaseUse.execute({
            name,
            username,
            password
        });

        return response.json(result);
    }

}

export { CreateClientsController }