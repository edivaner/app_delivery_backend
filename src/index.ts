import express, { response } from 'express';
import cors from 'cors';
import { router } from './routes';
import "express-async-errors";
import { AppError } from './errors/AppError';

const app = express();

app.use(cors());
app.use(express.json());

app.use(router);

app.use((err: Error, request: express.Request, response: express.Response, next: express.NextFunction) => {
    if (err instanceof Error) {
        return response.status(400).json({
            message: err.message
        });
    }

    return response.status(500).json({
        status: "error",
        message: `Internal server error in aplication!`
    });
})

app.get('/', async (req, res) => {
    return res.json({
        message: "Hello world! Aqui iniciou sua empresa!"
    })
});

const port = process.env.PORT || 3000;
app.listen(port, () => {
    console.log(`Server listening on port ${port}`);
});
