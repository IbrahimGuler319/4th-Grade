select * from denormalized;


LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\languages.csv"
INTO TABLE denormalized
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
    pldb_id,
    title,
    @description,
    @type,
    appeared,
    creator,
    website,
    domain_me,
    domain_me_registered,
    @reference,
    isbndb,
    book_count,
    semantic_scholar,
    language_rank,
    github_repo,
    @github_repo_stars,
    @github_repo_forks,
    @github_repo_updated,
    @github_repo_subscribers,
    @github_repo_created,
    @github_repo_description,
    @github_repo_issues,
    @github_repo_first_commit,
    @github_language,
    @github_language_tm_scope,
    @github_language_type,
    @github_language_ace_mode,
    @github_language_file_extensions,
    @github_language_repos,
    wikipedia,
    wikipedia_daily_page_views,
    wikipedia_backlinks_count,
    wikipedia_summary,
    wikipedia_page_id,
    wikipedia_appeared,
    wikipedia_created,
    wikipedia_revision_count,
    wikipedia_related,
    features_has_comments,
    features_has_semantic_indentation,
    features_has_line_comments,
    line_comment_token,
    last_activity,
    number_of_users,
    number_of_jobs,
    origin_community,
    central_package_repository_count,
    file_type,
    is_open_source
);


show variables like "secure_file_priv";

insert into movies
select distinct movie_id, title, ranking,rating, year,votes, duration, oscars, budget
from denormalized
order by movie_id;

select * from movies;

insert into stars
select distinct star_id, star_country_id, star_name
from denormalized
order by star_id;

CREATE TABLE denormalized (
    pldb_id VARCHAR(255) NOT NULL,                      -- Dilin benzersiz kimliği
    title VARCHAR(255),                                 -- Dilin adı
    description TEXT,                                   -- Açıklama
    type VARCHAR(50),                                   -- Dil türü (ör. pl, markup, query)
    appeared INT,                                       -- İlk ortaya çıkış yılı
    creators TEXT,                                      -- Yaratıcılar
    website VARCHAR(255),                               -- Resmi web sitesi
    domain_me VARCHAR(255),                             -- Domain adı
    domain_me_registered FLOAT,                        -- Domain kayıt tarihi
	reference TEXT,                                     -- Referans
    isbndb FLOAT,                                       -- ISBN veritabanı verisi
    book_count INT,                                     -- Kitap sayısı
    semantic_scholar FLOAT,                             -- Semantic Scholar bilgisi
    language_rank INT,                                  -- Dilin sıralaması
    github_repo VARCHAR(255),                          -- GitHub deposu
    github_repo_stars INT,                              -- Yıldız sayısı
    github_repo_forks INT,                              -- Fork sayısı
    github_repo_updated YEAR,                          -- Son güncelleme yılı
    github_repo_subscribers INT,                       -- Abone sayısı
    github_repo_created YEAR,                          -- Oluşturulma yılı
    github_repo_description TEXT,                      -- GitHub açıklaması
    github_repo_issues INT,                            -- Sorun sayısı
    github_repo_first_commit YEAR,                     -- İlk commit yılı
    github_language VARCHAR(255),                     -- GitHub dili
    github_language_tm_scope VARCHAR(255),            -- Dil tanımı
    github_language_type VARCHAR(50),                 -- Dil türü
    github_language_ace_mode VARCHAR(50),             -- ACE Mode
    github_language_file_extensions TEXT,             -- Dosya uzantıları
    github_language_repos FLOAT,                      -- Depo sayısı
    wikipedia VARCHAR(255),                           -- Wikipedia sayfası
    wikipedia_daily_page_views INT,                   -- Günlük sayfa görüntüleme
    wikipedia_backlinks_count INT,                    -- Geri bağlantı sayısı
    wikipedia_summary TEXT,                           -- Wikipedia özeti
    wikipedia_page_id BIGINT,                         -- Wikipedia sayfa kimliği
    wikipedia_appeared BIGINT,                          -- Wikipedia'da görünme yılı
    wikipedia_created YEAR,                           -- Wikipedia oluşturma yılı
    wikipedia_revision_count INT,                     -- Revizyon sayısı
    wikipedia_related TEXT,                           -- İlgili sayfalar
    features_has_comments BOOLEAN,                    -- Yorum desteği
    features_has_semantic_indentation BOOLEAN,        -- Semantik girinti
    features_has_line_comments BOOLEAN,               -- Satır içi yorumlar
    line_comment_token VARCHAR(50),                   -- Yorum tokenı
    last_activity INT,                                -- Son aktivite yılı
    number_of_users BIGINT,                           -- Kullanıcı sayısı
    number_of_jobs BIGINT,                            -- İş sayısı
    origin_community TEXT,                   -- Kaynak topluluk
    central_package_repository_count FLOAT,          -- Paket deposu sayısı
    file_type VARCHAR(50),                           -- Dosya türü
    is_open_source BOOLEAN,                          -- Açık kaynak mı
    PRIMARY KEY (pldb_id)                            -- Birincil anahtar
);


CREATE TABLE community (
	community_id INT,
    origin_community TEXT,                   -- Kaynak topluluk
    central_package_repository_count FLOAT,          -- Paket deposu sayısı
    is_open_source BOOLEAN,						-- Açık kaynak mı
    PRIMARY KEY (community_id)
);

CREATE TABLE creator (
	creator_id INT,
    creators TEXT,                  
    PRIMARY KEY (creator_id)
);

Create Table file_extensions(
	ext_id INT,
    github_language_file_extensions TEXT,
    Primary Key(ext_id)
);

