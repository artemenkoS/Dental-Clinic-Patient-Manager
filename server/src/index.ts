import express from "express";
import cors from "cors";
import cookieParser from "cookie-parser";
import WebSocket, { WebSocketServer } from "ws";
import http from "http";
import patientRoutes from "./routes/patient.route";
import visitRoutes from "./routes/visit.route";
import authRoutes from "./routes/auth.route";
import doctorRoutes from "./routes/doctor.route";
import userRoutes from "./routes/user.route";
import procedureRoutes from "./routes/procedure.route";
import historyRoute from "./routes/history.route";
import roleRouter from "./routes/role.router";

require("dotenv").config();

export interface CustomWebSocket extends WebSocket {
  userId?: string;
}

const PORT = process.env.PORT || 8080;

const server = express();
const httpServer = http.createServer(server);
export const wss = new WebSocketServer({ server: httpServer });

wss.on("connection", (ws: CustomWebSocket) => {
  ws.send("Connection established");

  ws.on("message", (message) => {
    const parsedMessage = message.toString();
    try {
      const parsedData = JSON.parse(parsedMessage);

      switch (parsedData.action) {
        case "connect":
          ws.userId = parsedData.id;
          console.log("hi", parsedData.id, ws.userId, wss.clients.size);

          break;
        default:
          console.log(`Received message: ${parsedMessage}`);
      }
    } catch (error) {
      console.error("Invalid JSON format");
    }
  });
});

server.use(cors());
server.use(express.json());
server.use(cookieParser());

server.use("/api", patientRoutes);
server.use("/api", procedureRoutes);
server.use("/api", visitRoutes);
server.use("/api", doctorRoutes);
server.use("/api", userRoutes);
server.use("/api", authRoutes);
server.use("/api", historyRoute);
server.use("/api", roleRouter);

httpServer.listen(PORT, () => {
  console.log(`Server started on port ${PORT}`);
});
