import Image from "next/image";
import Link from "next/link";
import appStore from "../../../../public/logo/app-store.png";
import playStore from "../../../../public/logo/play-store.png";
import FooterLinkGrid from "./component/FooterLinkGrid";

export default function Footer() {
  return (
    <div className="w-full flex flex-col px-5 md:px-[160px] md:py-vv-large py-v-large bg-onSurfaceVariant md:gap-y-vv-large gap-y-large">
      <div className="flex md:flex-row flex-col justify-between items-start  gap-y-large">
        <div className="flex flex-col md:gap-y-v-large gap-y-large w-full md:w-[400px]">
          <div className="flex flex-col gap-y-small">
            <p className="prose-display-small md:prose-display-medium text-onPrimary">
              Let’s stay in touch
            </p>
            <p className="prose-body-large text-primaryContainer opacity-80">
              Subscribe to our newsletter to receive latest articles to your
              inbox weekly.
            </p>
          </div>
          <div className="flex flex-row h-[50px] bg-onPrimary rounded-md">
            <div className="flex-grow">
              <input
                type="text"
                placeholder="Enter your email"
                className="w-full h-full border-none bg-transparent text-secondary px-small"
              />
            </div>
            <div className="flex bg-primary w-[140px] justify-center items-center h-full rounded-md">
              <p className="prose-body-large text-onPrimary">Subscribe</p>
            </div>
          </div>
        </div>
        <div className="flex flex-col gap-y-small md:gap-y-large">
          <div className="flex flex-col gap-y-small">
            <p className="prose-display-small md:prose-display-medium text-onPrimary">Apps</p>
          </div>
          <div className="flex flex-row gap-large">
            <Link href="#">
              <Image src={appStore} width={150} height={50} alt="App store" />
            </Link>
            <Link href="#">
              <Image src={playStore} width={150} height={50} alt="Play store" />
            </Link>
          </div>
        </div>
        <FooterLinkGrid />
      </div>
      <div className="h-[1px] w-full bg-onPrimary opacity-10" />
      <div className="flex md:flex-row flex-col justify-between">
        <p className="prose-body-large text-primaryContainer">
          ©2024 Multiverse. All rights reserved
        </p>
        <p className="prose-body-large text-primaryContainer ">
          Privacy & Policy
        </p>
        <p className="prose-body-large text-primaryContainer ">
          Terms & Condition
        </p>
      </div>
    </div>
  );
}
