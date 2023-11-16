import { FaEdit, FaTrash } from 'react-icons/fa';
import { Link, useNavigate, useParams } from "react-router-dom";
import customerservice from '../../../services/CustomerService';
import { useEffect, useState } from 'react';
import { urlImage } from '../../../config';
function CustomerShow(){
    const navigate = useNavigate();

    const { id } = useParams("id");
    const [customer, setcustomer] = useState([]);
    useEffect(function () {
        (async function () {
            await customerservice.getById(id).then(function (result) {
                setcustomer(result.data.data);
            });
        })();
    }, []);
    function customerDelete(id){
        customerservice.remove(id).then(function (result) {
            alert(result.data.message);
            navigate('/admin/customer', { replace: true })
        });
    }
    return (
        <section className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-danger  ">CHI TIẾT KHÁCH HÀNG</strong>
                    </div>
                    <div className="col-md-6 text-end">
                        <Link to="/admin/customer" className="btn btn-sm btn-outline-success me-1">
                            Về Danh Sách
                        </Link>
                        <Link to={"/admin/customer/update/" + customer.id} className="btn btn-sm btn-outline-primary me-1 ">
                            <FaEdit /> Sửa
                        </Link>
                        <button onClick={()=>customerDelete(customer.id)}className="btn btn-sm btn-outline-danger me-1">
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
                            <td>Hình</td>
                            <td><img style={{width:200}}className="img-fluid" src={urlImage+'customer/'+customer.image} alt={customer.name} /></td>
                        </tr>
                        <tr>
                            <td>Tên Người Dùng</td>
                            <td>{customer.name}  </td>
                        </tr>
                        <tr>
                            <td>Ngày Sinh</td>
                            <td>{customer.dateofbirth}  </td>
                        </tr>
                        <tr>
                            <td>Giới Tính</td>
                            <td>{customer.sex}</td>
                        </tr>
                        <tr>
                            <td>Điện Thoại</td>
                            <td>{customer.phone}  </td>
                        </tr>
                       
                        <tr>
                            <td>Email</td>
                            <td>{customer.email}  </td>
                        </tr>
                        <tr>
                            <td>Địa Chỉ</td>
                            <td>{customer.address}  </td>
                        </tr>
                        <tr>
                            <td>Trạng Thái</td>
                            <td>{customer.status}  </td>
                        </tr>
                    </tbody>
                </table>

            </div>
        </section>

    );
}
export default CustomerShow;