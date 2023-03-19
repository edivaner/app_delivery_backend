import { ICreateClientsDTO } from "../dtos/ICreateClientsDTO";
import { Clients } from "../entities/Clients";

interface IClientsRepository {
    create(data: ICreateClientsDTO): Promise<Clients>
}

export { IClientsRepository }