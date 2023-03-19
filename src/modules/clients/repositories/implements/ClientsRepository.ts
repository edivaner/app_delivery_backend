import { ICreateClientsDTO } from "modules/clients/dtos/ICreateClientsDTO";
import { Clients } from "modules/clients/entities/Clients";
import { IClientsRepository } from "../IClientsRepository";
import { Repository, getRepository } from "typeorm";

class ClientsRepository implements IClientsRepository {
    private clientsRepository: Repository<Clients>;

    constructor() {
        this.clientsRepository = getRepository(Clients);
    }

    async create({ name, username, password, telephone }: ICreateClientsDTO): Promise<Clients> {
        const client = this.clientsRepository.create({ name, username, password, telephone })
        await this.clientsRepository.save(client);
        return client;
    }
}
export { ClientsRepository }