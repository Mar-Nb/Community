import axios from 'axios';
import AsyncStorage from "@react-native-async-storage/async-storage";

const BASE_URL = 'https://apicommunity.merryservices.net';
const CREDENTIALS_KEY_ASYNC_STORAGE = "TOKENID";

export async function persistCredentials(credentials) {
    if (credentials) {
        const credentialsJson = JSON.stringify({
            token: credentials.token,
            refreshToken: credentials.refreshToken,
            expiresAt: Date.now() + (credentials.expiresIn * 1000)
        });
        await AsyncStorage.setItem(CREDENTIALS_KEY_ASYNC_STORAGE, credentialsJson);
    } else {
        await AsyncStorage.removeItem(CREDENTIALS_KEY_ASYNC_STORAGE);
    }
}

axios.interceptors.request.use(async config => {
    const credentialsJson = await AsyncStorage.getItem(CREDENTIALS_KEY_ASYNC_STORAGE);
    const needsAuth = credentialsJson &&
        !config.url.endsWith(`/api/connect`) &&
        !config.url.includes(`refresh`) &&
        !config.url.endsWith(`/api/user`);
    if (needsAuth) {
        let { token, refreshToken, expiresAt } = JSON.parse(credentialsJson);
        if (expiresAt < Date.now()) {
            const newCredentials = await refreshCredentials(refreshToken);
            await persistCredentials(newCredentials);
            token = newCredentials.token;
        }
        config.headers.authorization = token;
    }
    return config;
});


export function refreshCredentials(refreshToken) {
    const url = `${BASE_URL}/api/refresh/${refreshToken}`;
    return axios
        .get(url)
        .then(response => response.data.response);
}


export function signUp(data) {
    const url = `${BASE_URL}/api/user`;
    return axios
        .post(url, data)
        .then(response => response.data);
}

export function postPasswordConnection(login, password) {
    const url = `${BASE_URL}/api/connect`;
    return axios
        .post(url, { login, password })
        .then(response => {
            persistCredentials(response.data.response);
            return response.data;
        });
}

export function getRessources(ressourceName) {
    const url = `${BASE_URL}/api/${ressourceName}`;
    return axios
        .get(url)
        .then(response => response.data);
}

export function getRessource(ressourceName, ressourceId) {
    const url = `${BASE_URL}/api/${ressourceName}/${ressourceId}`;
    if (!ressourceId)
        return new Promise((resolve, reject) => reject("no id"));
    return axios
        .get(url)
        .then(response => response.data);
}

export function createRessource(ressourceName, data) {
    const url = `${BASE_URL}/api/${ressourceName}`;
    return axios
        .post(url, data)
        .then(response => response.data);
}

export function updateRessource(ressourceName, ressourceId, data) {
    const url = `${BASE_URL}/api/${ressourceName}/${ressourceId}`;
    return axios
        .put(url, data)
        .then(response => response.data);
}

export function deleteRessource(ressourceName, ressourceId) {
    const url = `${BASE_URL}/api/${ressourceName}/${ressourceId}`;
    return axios
        .delete(url)
        .then(response => response.data);
}
