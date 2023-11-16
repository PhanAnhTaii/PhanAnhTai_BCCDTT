import httpAxios from "../httpAxios";
function getAll() {
   return httpAxios.get('user/index');
}
function getById(id) {
    return httpAxios.get(`user/show/${id}`);
}
function create(user) {
    return httpAxios.post('user/store',user);
}
function register(user) {
    return httpAxios.post('user/register',user);
}
function update(user,id) {
    return httpAxios.post(`user/update/${id}`,user);
}
function remove(id) {
    return httpAxios.delete(`user/destroy/${id}`);  
}
function login(user){
    return httpAxios.post('user/login',user);
}
function sortdelete(id) {
    return httpAxios.post(`user/sortdelete/${id}`);
}
function restore(id) {
    return httpAxios.post(`user/restore/${id}`);
}
function getTrash() {
    return httpAxios.get('user/trash');
 }
const userservice={
    gettAll:getAll,
    getById:getById,
    create:create,
    update:update,
    remove:remove,
    login:login, 
    getTrash:getTrash,
    restore:restore,
    sortdelete,sortdelete,
    register:register
}
export default userservice;



