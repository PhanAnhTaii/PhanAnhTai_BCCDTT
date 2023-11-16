import { useEffect, useState } from "react";
import contactservice from "../../../services/ContactService";
import { Link, useNavigate } from "react-router-dom";

function Contact() {
    const navigate = useNavigate();

  
    const [user_id, setUserId]= useState(0);
    const [name, setName] = useState('');
    const [email, setEmail] = useState('');
    const [phone, setPhone] = useState();
    const [title, setTitle] = useState('0');
    const [content, setContent] = useState('');
    const [status, setStatus] = useState(1);
    async function contactStore(event) {
        event.preventDefault();
        var contact = new FormData();
        contact.append("user_id", user_id);
        contact.append("name", name);
        contact.append("email", email);
        contact.append("phone", phone);
        contact.append("title", title);
        contact.append("content", content);
        contact.append("status", status);
        await contactservice.create(contact)
            .then(function (res) {
                alert(res.data.message);
                navigate('/lien-he', { replace: true })
                window.location.reload(false)
            });

    }
    return (
        <section className="contact">
            <div className="container my-2">
                <h2 className="text-center text-danger">LIÊN HỆ</h2>
                <div className="row">
                    <div className="col-md-4 my-3">
                        <form onSubmit={contactStore} method="post">
                            <div className="mb-3 ">
                                
                                <input placeholder="Tên"type="text" name="name" value={name} onChange={(e) => setName(e.target.value)} className="form-control" />
                            </div>
                            <div className="mb-3 my-3">
                                
                                <input placeholder="Email"type="text" name="name" value={email} onChange={(e) => setEmail(e.target.value)} className="form-control"></input>
                            </div>
                            <div className="mb-3 my-3">

                                <input placeholder="Số điện thoại" type="text" name="name" value={phone} onChange={(e) => setPhone(e.target.value)} className="form-control"></input>
                            </div>
                        <div className="mb-3 my-3">

                            <input type="text" placeholder="Nội dung" name="name" value={content} onChange={(e) => setContent(e.target.value)} className="form-control"></input>
                        </div>

                        <button style={{ width: 413, height: 40, borderRadius: 15,backgroundColor:"#031b36" }} className="btn btn-outline-light" type="submit"><strong>Gửi</strong></button><br />
                    
                        <div className="list-menu toggle-mn list-info">
						<div className="content-contact clearfix my-3">
							<span className="list_footer">
								<b>Địa chỉ: </b>
								103 Phường Tăng Nhơn Phú B, Quận 9, TP. Hồ Chí Minh								
							</span>
						</div>
						<div className="content-contact clearfix my-2">
							<span className="list_footer">
								<b>Điện thoại: </b>
								<Link style={{color:"red",textDecorationLine:"none"}} title="1900 6750" to="tel:19006750">
									0397901748
								</Link>
							</span>
						</div>
						<div className="content-contact clearfix my-2">
							<span className="list_footer">
								<b>Email: </b>
								<Link style={{color:"red",textDecorationLine:"none"}}title="support@sapo.vn" to="mailto:beansport@gmail.com">
								watchstore@gmail.com
								</Link>
							</span>
						</div>
					</div>
                </form>
            </div>
            <div className="col-md-5 my-3" ><iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d10924.773737466909!2d106.77984241469137!3d10.836396334078056!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1svi!2s!4v1684997625256!5m2!1svi!2s"
                style={{ border: 0, width: 850, height: 500 }} allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
        </div>
            </div >
        </section >
    );
}
export default Contact;