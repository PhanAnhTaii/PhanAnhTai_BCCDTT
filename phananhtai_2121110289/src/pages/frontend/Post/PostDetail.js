import { useState } from "react";
import postservice from "../../../services/PostService";
import { useEffect } from "react";
import { useParams } from "react-router-dom";
import { urlImage } from "../../../config";
import PostItem from "../../../components/frontend/PostItem";

function PostDetail() {
    const { slug } = useParams();
    const [post, setPost] = useState([]);
    const [post_other, setPostOther] = useState([]);
    useEffect(function () {
        (function () {
            postservice.getPostBySlug(slug).then(function (result) {
                if (result.data.success === true) {
                    setPost(result.data.post);
                    setPostOther(result.data.post_other);
                }

            });
        })();
    }, [slug])
    return (
        <section className="maincontent my-4">
            <div className="container ">
                <div className="row">
                    <div className="col-md-12 my-1">
                        <h4 className="my-4 text-center text-danger"><b>{post.title}</b></h4>
                        <img src={urlImage + 'postt/' + post.image} className="img-fluid w-100" /></div>
                    <h4 className="my-3"> <strong className="text-danger">Chi Tiết :</strong> {post.detail}</h4>
                </div>
                <h3 className="py-3 text-danger"><b>Bài Viết Cùng Chủ Đề</b></h3>
                <div className="row my-2">
                    {post_other.map(function (post, index) {
                        return <PostItem post={post} key={index} />
                    })}

                </div>
            </div>
        </section>
    );
}

export default PostDetail;