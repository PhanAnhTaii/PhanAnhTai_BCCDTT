import httpAxios from "../httpAxios";
function getAll() {
   return httpAxios.get('voucher/index');
}
function getById(id) {
    return httpAxios.get(`voucher/show/${id}`);
}
function create(voucher) {
    return httpAxios.post('voucher/store',voucher);
}
function update(voucher,id) {
    return httpAxios.post(`voucher/update/${id}`,voucher);
}
function remove(id) {
    return httpAxios.delete(`voucher/destroy/${id}`);
}
const voucherservice={
    gettAll:getAll,
    getById:getById,
    create:create,
    update:update,
    remove:remove
}
export default voucherservice;



