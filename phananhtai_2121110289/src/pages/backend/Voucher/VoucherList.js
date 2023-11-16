import { FaPlus, FaRegEye, FaEdit, FaTrash ,FaArrowLeft} from 'react-icons/fa';
import { Link } from "react-router-dom";
import { useState } from 'react';
import { useEffect } from 'react';
import voucherservice from '../../../services/VoucherService';
function VoucherList() {
    const [statusdel,setStatusDel]=useState(0);
    const [vouchers, setvouchers] = useState([]);
    useEffect(function () {
        (async function () {
            await voucherservice.gettAll().then(function (result) {
                setvouchers(result.data.data);
            });
        })();
    }, [statusdel])
    function voucherDelete(id) {
        voucherservice.remove(id).then(function (result) {
            console.log(result.data.message);
            setStatusDel(result.data.id);
        });
    }
    return (
        <section className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-danger">DANH SÁCH KHUYẾN MÃI</strong>
                    </div>
                    <div className="col-md-6 text-end">
                    <Link to="/admin" className="btn btn-sm btn-outline-warning  me-2">
                            <FaArrowLeft />Về Trang Chủ
                        </Link>
                        <Link to="/admin/voucher/create" className="btn btn-sm btn-outline-success">
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
                    
                            <th style={{ width: 200 }}className="text-center">Mã Khuyến Mãi</th>
                         
                            <th style={{ width: 130 }} className="text-center">Giá Trị Giảm</th>                          

                            <th style={{ width: 130 }} className="text-center">Ngày tạo</th>
                            <th style={{ width: 140 }} className="text-center">Chức năng</th>
                            <th style={{ width: 30 }} className="text-center">ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        {vouchers.map(function (voucher, index) {
                            return <tr key={index}>
                                <td className="text-center">
                                    <input type="checkbox" />
                                </td>
                                
                                <td className="text-center">{voucher.voucher_code}</td>

                                <td className="text-center">{voucher.reduced_value}</td>
                                
                                <td className="text-center">{voucher.created_at}</td>
                                <td className="text-center">
                                    <Link to={"/admin/voucher/show/"+voucher.id} className="btn btn-sm btn-outline-success me-1">
                                        <FaRegEye />
                                    </Link>
                                    <Link to={"/admin/voucher/update/"+voucher.id} className="btn btn-sm btn-outline-primary me-1 ">
                                        <FaEdit />
                                    </Link>
                                    <button onClick={() => voucherDelete(voucher.id)} className="btn btn-sm btn-outline-danger me-1">
                                        <FaTrash />
                                    </button>

                                </td>
                                <td className="text-center">{voucher.id}</td>
                            </tr>
                        })} 

                    </tbody>
                </table>
            </div>
        </section>);
}
export default VoucherList;