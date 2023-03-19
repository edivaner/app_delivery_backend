import { container } from 'tsyringe';

import { IClientsRepository } from '../../modules/clients/repositories/IClientsRepository';
import { ClientsRepository } from '../../modules/clients/repositories/implements/ClientsRepository';

container.registerSingleton<IClientsRepository>(
    "ClientsRepository", //Nome do container
    ClientsRepository // Repositorio
);
