import axios from "axios";

export const HTTP = axios.create({
  baseURL: "http://" + location.hostname + ":8088/v1"
});

export default HTTP;
