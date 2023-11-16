import { FaPlus, FaRegEye, FaEdit, FaTrash ,FaArrowLeft,FaTrashAlt} from 'react-icons/fa';
import { Link } from "react-router-dom";
import { useState } from 'react';
import { useEffect } from 'react';
import customerservice from '../../../services/CustomerService';
import { urlImage } from '../../../config';

function CustomerList() {
    const [statusdel,setStatusDel]=useState(0);
    const [customers, setCustomers] = useState([]);
    useEffect(function () {
        (async function () {
            await customerservice.gettAll().then(function (result) {
                setCustomers(result.data.data);
            });
        })();
    }, [statusdel])
    function customerDelete(id) {
        customerservice.sortdelete(id).then(function (result) {
            console.log(result.data.message);
            setStatusDel(result.data.id);
        });
    }
    return (
        <section className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-danger">DANH SÁCH KHÁCH HÀNG</strong>
                    </div>
                    <div className="col-md-6 text-end">
                    <Link to={"/admin/customer/trash"} className="btn btn-sm btn-outline-primary  me-2" >
                            <FaTrashAlt /> Thùng rác
                        </Link>
                    <Link to="/admin" className="btn btn-sm btn-outline-warning  me-2">
                            <FaArrowLeft />Về Trang Chủ
                        </Link>
                        <Link to="/admin/customer/create" className="btn btn-sm btn-outline-success">
                            <FaPlus />Thêm
                        </Link>
                    </div>
                </div>
            </div>
            <div className="card-body">
                <table className="table table-striped table-bordered table-hover" >
                    <thead>
                        <tr>
                            <th style={{ width: 50 }} className="text-center">#</th>
                    
                            <th style={{ width: 200 }}className="text-center">Hình</th>
                            <th style={{ width: 200 }}className="text-center">Tên</th>
                            <th style={{ width: 130 }} className="text-center">Ngày Sinh</th>
                            <th style={{ width: 130 }} className="text-center">Giới Tính</th>
                            <th style={{ width: 130 }} className="text-center">Quốc Gia</th>
                            <th style={{ width: 130 }} className="text-center">Điện thoại</th>
                            <th style={{ width: 130 }} className="text-center">Email</th>
                            <th style={{ width: 130 }} className="text-center">Địa chỉ</th>
                            <th style={{ width: 130 }} className="text-center">Ngày tạo</th>
                            <th style={{ width: 140 }} className="text-center">Chức năng</th>
                            <th style={{ width: 30 }} className="text-center">ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        {customers.map(function (customer, index) {
                            return <tr key={index}>
                                <td className="text-center">
                                    <input type="checkbox" />
                                </td>
                                <td className="text-center">
                                    <img style={{ width: 200, height: 150 }} className="img-fluid" src={urlImage + 'customer/' + customer.image} alt={customer.name} />
                                </td>
                                
                                <td className="text-center">{customer.name}</td>

                                <td className="text-center">{customer.dateofbirth}</td>
                                <td className="text-center">{customer.sex}</td>
                                <td className="text-center">{customer.nationality}</td>
                                <td className="text-center">{customer.phone}</td>
                                <td className="text-center">{customer.email}</td>
                                <td className="text-center">{customer.address}</td>
                                <td className="text-center">{customer.created_at}</td>
                                <td className="text-center">
                                    <Link to={"/admin/customer/show/"+customer.id} className="btn btn-sm btn-outline-success me-1">
                                        <FaRegEye />
                                    </Link>
                                    <Link to={"/admin/customer/update/"+customer.id} className="btn btn-sm btn-outline-primary me-1 ">
                                        <FaEdit />
                                    </Link>
                                    <button onClick={() => customerDelete(customer.id)} className="btn btn-sm btn-outline-danger me-1">
                                        <FaTrash />
                                    </button>

                                </td>
                                <td className="text-center">{customer.id}</td>
                            </tr>
                        })} 

                    </tbody>
                </table>
            </div>
        </section>);
}
export default CustomerList;