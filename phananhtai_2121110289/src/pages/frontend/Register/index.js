import { useState } from "react";
import { FaFacebookF, FaTwitter, FaGoogle, FaGithub } from "react-icons/fa";
import { Link, useNavigate } from "react-router-dom";
import userservice from "../../../services/UserService";
function Login() {
    const navigate = useNavigate();
    const [name, setName] = useState('');
    const [email, setEmail] = useState('');
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const [status, setStatus] = useState(1);
    async function userStore(event) {
    
        event.preventDefault();
        var user = new FormData();
        user.append("name", name);
        user.append("email", email);
        user.append("username", username);
        user.append("password1", password);
        user.append("roles", '0');
        user.append("status", status);

        await userservice.register(user)
            .then(function (res) {
                alert(res.data.message)
                navigate('/dang-nhap', { replace: true })
            });

    }
    return (
        <div className=" container">
            <section className="text-center container my-3">
                <div className="p-5 bg-image" style={{ backgroundImage: `url("https://mdbootstrap.com/img/new/textures/full/171.jpg")`, height: 300 }}></div>

                <div className="card mx-4 mx-md-5 shadow-5-strong" style={{ marginTop: -100, background: `hsla(0, 0, 100, 0.8)`, backdropFilter: `blur(30)` }}>
                    <div className="card-body py-5 px-md-5">

                        <div className="row d-flex justify-content-center">
                            <div className="col-lg-8">
                                <h2 className="fw-bold mb-5">Đăng Ký</h2>
                                <form onSubmit={userStore} method="post">
                                    <div className="row">
                                        <div className="col-md-6 mb-4">
                                            <div className="form-outline">
                                                <input type="text"  value={name} onChange={(e) => setName(e.target.value)}className="form-control" placeholder="First name" />

                                            </div>
                                        </div>
                                        <div className="col-md-6 mb-4">
                                            <div className="form-outline">
                                                <input type="text"  value={username} onChange={(e) => setUsername(e.target.value)}className="form-control" placeholder="Last name" />
                                            </div>
                                        </div>
                                    </div>

                                    <div className="form-outline mb-4">
                                        <input type="email" value={email} onChange={(e) => setEmail(e.target.value)} className="form-control" placeholder="Email address" />
                                    </div>

                                    <div className="form-outline mb-4">
                                        <input type="password" value={password} onChange={(e) => setPassword(e.target.value)}className="form-control" placeholder="Password" />
                                    </div>

                                    <div className="form-check d-flex justify-content-center mb-4">
                                        <input className="form-check-input me-2" type="checkbox" value=""  />
                                        <label className="form-check-label" for="form2Example33">
                                            Subscribe to our newsletter
                                        </label>
                                    </div>

                                    <button type="submit" className="btn btn-primary btn-block mb-4" style={{ width: 400 }}>
                                        Sign up
                                    </button>


                                    <div className="text-center">
                                        <p>or sign up with:</p>
                                        <button type="button" className="btn btn-link btn-floating mx-1">
                                            <i className="fab fa-facebook-f"><FaFacebookF /></i>
                                        </button>

                                        <button type="button" className="btn btn-link btn-floating mx-1">
                                            <i className="fab fa-google"><FaGoogle /></i>
                                        </button>

                                        <button type="button" className="btn btn-link btn-floating mx-1">
                                            <i className="fab fa-twitter"><FaTwitter /></i>
                                        </button>

                                        <button type="button" className="btn btn-link btn-floating mx-1">
                                            <i className="fab fa-github"><FaGithub /></i>
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    );
}
export default Login;