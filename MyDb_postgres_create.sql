CREATE TABLE "public.users" (
	"id" serial NOT NULL,
	"userName" serial NOT NULL,
	"password" TEXT NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.items" (
	"itemId" serial NOT NULL,
	"itemName" serial NOT NULL,
	"itemPrice" serial NOT NULL,
	"photosId" serial NOT NULL,
	"sizesId" serial NOT NULL,
	"categoryId" int NOT NULL,
	CONSTRAINT "items_pk" PRIMARY KEY ("itemId")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.photos" (
	"id" serial NOT NULL,
	"primaryPhoto" serial NOT NULL,
	"secondaryPhoto" serial,
	"thirdPhoto" serial,
	"forthPhoto" serial,
	CONSTRAINT "photos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.categories" (
	"id" serial NOT NULL,
	"name" serial NOT NULL,
	CONSTRAINT "categories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.sizes" (
	"id" serial NOT NULL,
	"name" serial NOT NULL,
	"quantity" serial NOT NULL,
	CONSTRAINT "sizes_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.cart" (
	"userId" int NOT NULL,
	"itemId" int NOT NULL
) WITH (
  OIDS=FALSE
);



ALTER TABLE "users" ADD CONSTRAINT "users_fk0" FOREIGN KEY ("id") REFERENCES "cart"("userId");

ALTER TABLE "items" ADD CONSTRAINT "items_fk0" FOREIGN KEY ("itemId") REFERENCES "cart"("itemId");
ALTER TABLE "items" ADD CONSTRAINT "items_fk1" FOREIGN KEY ("photosId") REFERENCES "photos"("id");
ALTER TABLE "items" ADD CONSTRAINT "items_fk2" FOREIGN KEY ("sizesId") REFERENCES "sizes"("id");
ALTER TABLE "items" ADD CONSTRAINT "items_fk3" FOREIGN KEY ("categoryId") REFERENCES "categories"("id");











