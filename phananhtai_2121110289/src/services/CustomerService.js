import httpAxios from "../httpAxios";
function getAll() {
   return httpAxios.get('customer/index');
}
function getById(id) {
    return httpAxios.get(`customer/show/${id}`);
}
function create(customer) {
    return httpAxios.post('customer/store',customer);
}
function update(customer,id) {
    return httpAxios.post(`customer/update/${id}`,customer);
}
function remove(id) {
    return httpAxios.delete(`customer/destroy/${id}`);
}
function sortdelete(id) {
    return httpAxios.post(`customer/sortdelete/${id}`);
}
function restore(id) {
    return httpAxios.post(`customer/restore/${id}`);
}
function getTrash() {
    return httpAxios.get('customer/trash');
 }
const customerservice={
    gettAll:getAll,
    getById:getById,
    create:create,
    update:update,
    remove:remove, 
    getTrash:getTrash,
    restore:restore,
    sortdelete,sortdelete
}
export default customerservice;



