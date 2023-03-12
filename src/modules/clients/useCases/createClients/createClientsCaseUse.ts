import { prisma } from "../../../../../database/prismaClient";
import { AppError } from "../../../../errors/AppError";

interface ICreateClients {
    name: string;
    username: string;
    password: string;
}

class CreateClientsCaseUse {
    async execute({ name, username, password }: ICreateClients) {
        const clientAlreadyExists = await prisma.clients.findFirst({
            where: {
                username: {
                    mode: "insensitive"
                }
            }
        })

        if (clientAlreadyExists)
            throw new Error('Cliente já cadastrado');

        const client = await prisma.clients.create({
            data: {
                name,
                username,
                password
            }
        });

        return client;
    }
}

export { CreateClientsCaseUse }