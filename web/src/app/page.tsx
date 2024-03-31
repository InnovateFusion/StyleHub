import Footer from "@/components/common/footer/Footer";
import Header from "@/components/common/header/Header";
import Landing from "@/components/landing/Landing";

export default function Home() {
  return (
    <div className="flex flex-col max-w-screen justify-center items-center">
      <Header />
      <Landing />
      <Footer />
    </div>
  );
}
