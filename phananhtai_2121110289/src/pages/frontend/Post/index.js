import { useEffect } from "react";
import { useState } from "react";
import postservice from "../../../services/PostService";
import { urlImage } from '../../../config';
import PostItem from "../../../components/frontend/PostItem";

function Post() {
    const [limit, setLimit] = useState(4);
    const [posts, setPosts] = useState([]);
    useEffect(function () {
        (async function () {
            await postservice.getByType('post', limit).then(function (result) {
                setPosts(result.data.posts);
            });
        })();
    }, [limit])
    return (
        <section>
            <div className="container my-4">
                <h3 className="text-center text-danger my-4">TẤT CẢ BÀI VIẾT</h3>
                <div className="row">
                    {posts.map(function (post, index) {
                        return <PostItem post={post} key={index} />
                    })}
                </div>

                <div className='text-center'>
                    <button  onClick={() => setLimit(limit + 4)} className='btn btn-success'>Xem thêm</button>
                </div>
            </div>
        </section>

    );
}

export default Post;