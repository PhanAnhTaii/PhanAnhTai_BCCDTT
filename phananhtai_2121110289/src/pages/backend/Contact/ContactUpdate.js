import { useEffect, useState } from "react";
import { Link, useParams,useNavigate } from "react-router-dom";
import contactservice from '../../../services/ContactService';
import userservice from "../../../services/UserService";

function ContactUpdate() {
    const [users, setUsers] = useState([]);
    useEffect(function () {
        (async function () {
            await userservice.gettAll().then(function (result){
                setUsers(result.data.data);
                });
        })();
    }, []);
    const navigate = useNavigate();
    const [user_id, setUserId] = useState();
    const [name, setName] = useState('');
    const [email, setEmail] = useState('');
    const [phone, setPhone] = useState('');
    const [title, setTitle] = useState('');
    const [content, setContent] = useState('');
    const [status, setStatus] = useState(1);
    ///////////////
    const { id } = useParams("id");
    ///////////////////
    useEffect(function () {
        (async function () {
            await contactservice.getById(id).then(function (result) {
                const tmp = result.data.data;
                setUserId(tmp.user_id);
                setName(tmp.name);
                setEmail(tmp.email);
                setPhone(tmp.phone);
                setTitle(tmp.title);
                setContent(tmp.content);
                setStatus(tmp.status);
            });
        })();
    }, []);
    ///////////lay danh sach
    const [contacts, setContacts] = useState([]);
    useEffect(function () {
        (async function () {
            await contactservice.gettAll().then(function (result) {
                setContacts(result.data.data);
            });
        })();
    }, []);


    async function contactEdit(event) {
        event.preventDefault();
        var contact = new FormData();
        contact.append("user_id", user_id);
        contact.append("name", name);
        contact.append("email", email);
        contact.append("phone", phone);
        contact.append("title", title);
        contact.append("content", content);
        contact.append("status", status);
        await contactservice.update(contact,id)
            .then(function (res) {
                alert(res.data.message)
                navigate('/admin/contact', { replace: true })
            });
    }
    return (
    
        <form onSubmit={contactEdit} method="post">
        <div className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-danger">
                            CẬP NHẬT LIÊN HỆ
                        </strong>
                    </div>
                    <div className="col-md-6 text-end">
                        <button type="submit" className=" btn btn-sm btn-success me-2">
                            Lưu
                        </button>
                        <Link to="/admin/contact" className="btn btn-sm btn-info">Về Danh Sách</Link>
                    </div>
                </div>
            </div>
            <div className="card-body">
                <div className="row">
                    <div className="col-md-9">
                        <div className="mb-3">
                            <label htmlFor="user_id">Người Dùng</label>
                            <select name="user_id" value={user_id} className="form-control" onChange={(e) => setUserId(e.target.value)}>
                                <option value="0">None</option>
                                {users.map(function (user, index) {
                                    return (
                                        <option key={index} value={user.id}>{user.name}</option>
                                    )
                                })}
                            </select>
                        </div>
                        <div className="mb-3">
                            <label htmlFor="name">Tên Liên Hệ</label>
                            <input type="text" name="name" value={name} onChange={(e) => setName(e.target.value)} className="form-control" />
                        </div>
                        <div className="mb-3">
                            <label htmlFor="name">Email</label>
                            <input type="text" name="name" value={email} onChange={(e) => setEmail(e.target.value)} className="form-control"></input>
                        </div>
                        <div className="mb-3">
                            <label htmlFor="name">Điện Thoại</label>
                            <input type="text" name="name" value={phone} onChange={(e) => setPhone(e.target.value)} className="form-control"></input>
                        </div>
                    </div>
                    <div className="col-md-3">

                        <div className="mb-3">
                            <label htmlFor="name">Tiêu Đề</label>
                            <textarea type="text" name="name" value={title} onChange={(e) => setTitle(e.target.value)} className="form-control"></textarea>
                        </div>

                        <div className="mb-3">
                            <label htmlFor="name">Nội Dung</label>
                            <textarea type="text" name="name" value={content} onChange={(e) => setContent(e.target.value)} className="form-control"></textarea>
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
export default ContactUpdate;