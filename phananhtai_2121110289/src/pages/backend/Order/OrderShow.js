import { FaEdit, FaTrash } from 'react-icons/fa';
import { Link, useNavigate, useParams } from "react-router-dom";
import orderservice from '../../../services/OrderServce';
import { useEffect, useState } from 'react';
function OrderShow(){
    const { id } = useParams("id");
    const navigate = useNavigate();
    const [order, setOrder] = useState([]);
    useEffect(function () {
        (async function () {
            await orderservice.getById(id).then(function (result) {
                setOrder(result.data.data);
            });
        })();
    }, []);
    function orderDelete(id){
        orderservice.remove(id).then(function (result) {
            alert(result.data.message);
            navigate('/admin/order', { replace: true })
        });
    }

    return (
        <section className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-danger  ">CHI TIẾT ĐƠN HÀNG</strong>
                    </div>
                    <div className="col-md-6 text-end">
                        <Link to="/admin/order" className="btn btn-sm btn-outline-success me-1">
                            Về Danh Sách
                        </Link>
                        <Link to={"/admin/order/update/" + order.id} className="btn btn-sm btn-outline-primary me-1 ">
                            <FaEdit /> Sửa
                        </Link>
                        <button onClick={()=>orderDelete(order.id)}className="btn btn-sm btn-outline-danger me-1">
                            <FaTrash /> Xóa
                        </button>
                    </div>
                </div>
            </div>
            <div className="card-body">
                <table className="table table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <td className="text-danger"style={{width:300}}><strong>Tên Trường</strong></td>
                            <td className="text-danger"><strong>Giá Trị</strong></td>
                        </tr>
                    </thead>
                    <tbody>
                    <tr>
                            <td>ID</td>
                            <td>{id}  </td>
                        </tr>
                        <tr>
                            <td>ID Người Dùng</td>
                            <td>{order.user_id}  </td>
                        </tr>
                        <tr>
                            <td>Tên Liên Hệ</td>
                            <td>{order.name}  </td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td>{order.email}  </td>
                        </tr>
                        <tr>
                            <td>Điện Thoại</td>
                            <td>{order.phone}  </td>
                        </tr>
                        <tr>
                            <td>Địa Chỉ</td>
                            <td>{order.address}  </td>
                        </tr>
                        <tr>
                            <td>Ghi Chú</td>
                            <td>{order.note}  </td>
                        </tr>
                        <tr>
                            <td>Trạng Thái</td>
                            <td>{order.status}  </td>
                        </tr>
                    </tbody>
                </table>

            </div>
        </section>

    );
}
export default OrderShow;