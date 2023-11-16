import { useState } from 'react';
import { useEffect } from 'react';
import { FaPlus, FaRegEye, FaEdit, FaTrash ,FaArrowLeft,FaTrashRestore } from 'react-icons/fa';
import { Link } from "react-router-dom";

import contactservice from '../../../services/ContactService';
function ConTactList() {
    const [statusdel,setStatusDel]=useState(0);
    const [contacts, setContacts] = useState([]);
    useEffect(function () {
        (async function () {
            await contactservice.getTrash().then(function (result) {
                setContacts(result.data.data);
            });
        })();
    }, [statusdel])
    function contactDelete(id) {
        contactservice.remove(id).then(function (result) {
            console.log(result.data.message);
            setStatusDel(result.data.id);
        });
    }function restore   (id) {
        contactservice.restore(id).then(function (result) {
            console.log(result.data.message);
            setStatusDel(result.data.id);
        });
    }
    return (
        
        <section className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-danger  ">THÙNG RÁC</strong>
                    </div>
                    <div className="col-md-6 text-end">
                    <Link to="/admin/contact" className="btn btn-sm btn-outline-warning  me-2">
                            <FaArrowLeft />Quay Lại
                        </Link>
                    </div>
                </div>
            </div>
            <div className="card-body">
                <table className="table table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th style={{ width: 50 }} className="text-center">#</th>
                            <th style={{ width: 200 }} className="text-center">Tên </th>
                            <th style={{ width: 200 }} className="text-center">Email </th>
                            <th style={{ width: 200 }} className="text-center">Điện Thoại </th>
                            <th style={{ width: 130 }} className="text-center">Ngày Tạo</th>
                            <th style={{ width: 140 }} className="text-center">Chức Năng</th>
                            <th style={{ width: 30 }} className="text-center">ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        {contacts.map(function(contact,index){
                            return <tr key={index }>
                            <td className="text-center">
                                <input type="checkbox" />
                            </td>
                            <td className="text-center">{contact.name}</td>
                            <td className="text-center">{contact.email}</td>
                            <td className="text-center">{contact.phone}</td>
                            <td className="text-center">{contact.created_at}</td>
                            <td className="text-center">
                            <button onClick={() => restore(contact.id)}className="btn btn-sm btn-outline-success me-1">
                            <FaTrashRestore />
                                </button>
                                <button onClick={() => contactDelete(contact.id)}className="btn btn-sm btn-outline-danger me-1">
                                     <FaTrash/> 
                                </button>
                            </td>
                            <td className="text-center">{contact.id}</td>
                        </tr>
                        })}
                        
                    </tbody>
                </table>
            </div>
        </section>);
}
export default ConTactList;