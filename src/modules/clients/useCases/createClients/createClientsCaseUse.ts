// import { prisma } from "../../../../../database/prismaClient";
import { inject, injectable } from "tsyringe";
import { Clients } from "modules/clients/entities/Clients";
import { IClientsRepository } from "modules/clients/repositories/IClientsRepository";
import { AppError } from "../../../../errors/AppError";

interface IRequest {
    name: string;
    username: string;
    password: string;
    telephone: string;
}

@injectable()
class CreateClientsCaseUse {
    constructor(
        @inject('ClientsRepository')
        private clientsRepository: IClientsRepository
    ) {
    }

    async execute({ name, username, password, telephone }: IRequest): Promise<Clients> {

        const client = await this.clientsRepository.create({ name, username, password, telephone })

        return client;
    }
}

export { CreateClientsCaseUse }