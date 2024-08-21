import {h} from 'preact';

export default function Home() {
    return (
        <div className="p-3">
            {conferences.map((conferences) => (
                <div className="card border shadow-sm lift mb-3">
                    <div className="card-body">
                        <div className="card-title">
                            <h4 className="font-weight-light">
                                {conference.city} {conference.year}
                            </h4>
                        </div>

                        <Link className="btn btn-sm btn-primary stretched-link" href={'/conference/'+conference.slug}>
                            View
                        </Link>
                    </div>
                </div>
            ))}
        </div>
    );
};