import { useEffect, useState } from "react";
import { Link, useParams,useNavigate } from "react-router-dom";
import voucherservice from '../../../services/VoucherService';

function VoucherUpdate() {
    const navigate = useNavigate();
    
    const [voucher_code, setVoucherCode] = useState('');
    const [reduced_value, setReducedValue] = useState('');
    const [status, setStatus] = useState(1);
    ///////////////
    const { id } = useParams("id");
    ///////////////////
    useEffect(function () {
        (async function () {
            await voucherservice.getById(id).then(function (result) {
                const tmp = result.data.data;
                setVoucherCode(tmp.voucher_code);
                setReducedValue(tmp.reduced_value);
                setStatus(tmp.status);
    
            });
        })();
    }, []);
    ///////////lay danh sach
    const [vouchers, setvouchers] = useState([]);
    useEffect(function () {
        (async function () {
            await voucherservice.gettAll().then(function (result) {
                setvouchers(result.data.data);
            });
        })();
    }, []);


    async function voucherEdit(event) {
        event.preventDefault();
        const image = document.querySelector("#image");
        var voucher = new FormData();   
        voucher.append("voucher_code", voucher_code);
        voucher.append("voucher_code", voucher_code);
        voucher.append("status", status);
        
        await voucherservice.update(voucher,id)
            .then(function (res) {
                alert(res.data.message)
                navigate('/admin/voucher', { replace: true })
            });
    }
    return (
    
        <form onSubmit={voucherEdit} method="post">
        <div className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-danger">
                            CẬP NHẬT KHUYẾN MÃI
                        </strong>
                    </div>
                    <div className="col-md-6 text-end">
                        <button type="submit" className=" btn YUJ6 me-2">
                            Lưu
                        </button>
                        <Link to="/admin/voucher" className="btn btn-sm btn-info">Về Danh Sách</Link>
                    </div>
                </div>
            </div>
            <div className="card-body">
                <div className="row">
                    <div className="col-md-9">
                        <div className="mb-3">
                            <label htmlFor="name">Mã Khuyến Mãi</label>
                            <input type="text" name="name" value={voucher_code} onChange={(e) => setVoucherCode(e.target.value)} className="form-control" />
                        </div>
                        <div className="mb-3">
                            <label htmlFor="name">Giá Trị Giảm</label>
                            <input type="text" name="name" value={reduced_value} onChange={(e) => setReducedValue(e.target.value)} className="form-control"></input>
                        </div>          
                        <div className="mb-3">
                            <label htmlFor="sort">Trạng Thái</label>
                            <select name="sort" value={status} className="form-control" onChange={(e) => setStatus(e.target.value)}>
                                <option value="1">Xuất bản</option>
                                <option value="2">Chưa xuất bản</option>

                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
);
}
export default VoucherUpdate;