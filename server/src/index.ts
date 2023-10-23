require("dotenv").config();
import express from "express";
import cors from "cors";
import cookieParser from "cookie-parser";
import patientRoutes from "./routes/patient.route";
import visitRoutes from "./routes/visit.route";
import authRoutes from "./routes/auth.route";
import doctorRoutes from "./routes/doctor.route";
import userRoutes from "./routes/user.route";
import procedureRoutes from "./routes/procedure.route";
import historyRoute from "./routes/history.route";

const PORT = process.env.PORT || 8080;

const server = express();
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

server.listen(PORT, () => console.log(`server started on port ${PORT}`));
