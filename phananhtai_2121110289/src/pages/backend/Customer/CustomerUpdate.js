import { useEffect, useState } from "react";
import { Link, useParams,useNavigate } from "react-router-dom";
import customerservice from '../../../services/CustomerService';

function CustomerUpdate() {
    const navigate = useNavigate();
    
    const [name, setName] = useState('');
    const [dateofbirth, setDateofbirth] = useState('');
    const [sex, setSex] = useState('');
    const [nationality, setNationality] = useState('');
    const [phone, setPhone] = useState('');
    const [email, setEmail] = useState('');
    const [address, setAddress] = useState('');
    const [status, setStatus] = useState(1);
    ///////////////
    const { id } = useParams("id");
    ///////////////////
    useEffect(function () {
        (async function () {
            await customerservice.getById(id).then(function (result) {
                const tmp = result.data.data;
                
                setName(tmp.name);
                setEmail(tmp.email);
                setPhone(tmp.phone);
                setStatus(tmp.status);
                setDateofbirth(tmp.dateofbirth);
                setNationality(tmp.nationality);
                setAddress(tmp.address);
                setSex(tmp.sex);
            });
        })();
    }, []);
    ///////////lay danh sach
    const [customers, setcustomers] = useState([]);
    useEffect(function () {
        (async function () {
            await customerservice.gettAll().then(function (result) {
                setcustomers(result.data.data);
            });
        })();
    }, []);


    async function customerEdit(event) {
        event.preventDefault();
        const image = document.querySelector("#image");
        var customer = new FormData();
        customer.append("name", name);
        customer.append("dateofbirth", dateofbirth);
        customer.append("sex", sex);
        customer.append("nationality", nationality);
        customer.append("phone", phone);
        customer.append("email", email);
        customer.append("address", address);
        customer.append("status", status);
        if (image.files.length === 0) 
        {
            customer.append("image","");
        }
        else 
        {
            customer.append("image", image.files[0]);
        }
        await customerservice.update(customer,id)
            .then(function (res) {
                alert(res.data.message)
                navigate('/admin/customer', { replace: true })
            });
    }
    return (
    
        <form onSubmit={customerEdit} method="post">
        <div className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-danger">
                           CẬP NHẬT KHÁCH HÀNG
                        </strong>
                    </div>
                    <div className="col-md-6 text-end">
                        <button type="submit" className=" btn btn-sm btn-success me-2">
                            Lưu
                        </button>
                        <Link to="/admin/customer" className="btn btn-sm btn-info">Về Danh Sách</Link>
                    </div>
                </div>
            </div>
            <div className="card-body">
                <div className="row">
                    <div className="col-md-9">
                        <div className="mb-3">
                            <label htmlFor="name">Họ Và Tên</label>
                            <input type="text" name="name" value={name} onChange={(e) => setName(e.target.value)} className="form-control" />
                        </div>
                        <div className="mb-3">
                            <label htmlFor="name">Ngày Sinh</label>
                            <input type="text" name="name" value={dateofbirth} onChange={(e) => setDateofbirth(e.target.value)} className="form-control"></input>
                        </div>
                        <div className="mb-3">
                            <label htmlFor="name">Giới Tính</label>
                            <input type="text" name="name" value={sex} onChange={(e) => setSex(e.target.value)} className="form-control"></input>
                        </div>
                        <div className="mb-3">
                            <label htmlFor="name">Quốc Gia</label>
                            <textarea type="text" name="name" value={nationality} onChange={(e) => setNationality(e.target.value)} className="form-control"></textarea>
                        </div>
                        <div className="mb-3">
                            <label htmlFor="name">Số Điện Thoại</label>
                            <textarea type="text" name="name" value={phone} onChange={(e) => setPhone(e.target.value)} className="form-control"></textarea>
                        </div>
                    </div>
                    <div className="col-md-3">
                    <div className="mb-3">
                            <label htmlFor="name">Email</label>
                            <textarea type="email" name="name" value={email} onChange={(e) => setEmail(e.target.value)} className="form-control"></textarea>
                        </div>
                    <div className="mb-3">
                            <label htmlFor="name">Địa Chỉ</label>
                            <textarea type="text" name="name" value={address} onChange={(e) => setAddress(e.target.value)} className="form-control"></textarea>
                        </div>
                        <div className="mb-3">
                            <label htmlFor="image">Hình Đại Diện</label>
                            <input type="file" id="image" className="form-control" />                          
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
export default CustomerUpdate;