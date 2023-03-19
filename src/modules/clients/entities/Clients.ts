import { Column, Entity, CreateDateColumn, PrimaryColumn, UpdateDateColumn } from "typeorm";
import { v4 as uuidV4 } from "uuid";

@Entity("clients")
class Clients {
    @PrimaryColumn()
    id: string;

    @Column()
    name: string;

    @Column()
    username: string;

    @Column()
    password: string;

    @Column()
    telephone?: string;

    @CreateDateColumn({ default: 'today' })
    created_at?: Date;

    @UpdateDateColumn({ default: null })
    updated_at?: Date;

    constructor() {
        if (!this.id)
            this.id = uuidV4();
    }

}

export { Clients }