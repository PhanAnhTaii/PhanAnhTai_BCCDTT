import axios from 'axios';
const httpAxios=axios.create({
    baseURL:'http://localhost:81/composer_phananhtai/public/api/',
    timeout:12000,
    headers:{'X-Custom-Header':'footbar'}
});
export default httpAxios;