"use client";

import { useState, useRef } from "react";
import Link from "next/link";
import Button from "../Button";
import Logo from "./Logo";

const Header = () => {
  const [isSidebarOpen, setIsSidebarOpen] = useState(false);
  const sidebarRef = useRef<HTMLDivElement>(null);

  const toggleSidebar = () => {
    setIsSidebarOpen(!isSidebarOpen);
  };

  const closeSidebar = (e: React.MouseEvent) => {
    if (
      sidebarRef.current &&
      e.target instanceof Node &&
      !sidebarRef.current.contains(e.target)
    ) {
      setIsSidebarOpen(false);
    }
  };

  return (
    <div className="h-[100px] bg-onPrimary w-full flex flex-row justify-between md:px-[160px] items-center">
      <div className="flex items-center justify-between px-5 md:px-0 w-full md:w-auto">
        <Logo />
        <button className="md:hidden" onClick={toggleSidebar}>
          <svg
            xmlns="http://www.w3.org/2000/svg"
            className="h-10 w-10"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
          >
            <path
              strokeLinecap="round"
              strokeLinejoin="round"
              strokeWidth={2}
              d="M4 6h16M4 12h16m-7 6h7"
            />
          </svg>
        </button>
      </div>
      <div className="w-2/5 hidden md:flex flex-row justify-center items-center gap-large">
        <input
          placeholder="search"
          type="search"
          className="p-5 w-full bg-slate-100 rounded-3xl"
        />
      </div>
      <div className="hidden md:flex justify-center items-center gap-x-10">
        <Link href="/products" className="prose-title-medium">
          SHOPS
        </Link>
        <Button
          label="LOGIN"
          color="text-onPrimary"
          backgroundColor="bg-primary"
        />
      </div>
      {isSidebarOpen && (
        <div
          className="fixed inset-0 z-50 bg-gray-800 bg-opacity-50 flex items-center justify-end"
          onClick={closeSidebar}
        >
          <div ref={sidebarRef} className="w-64 bg-gray-900 h-full pt-12">
            <button
              className="absolute top-2 right-2 text-white"
              onClick={toggleSidebar}
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                className="h-8 w-8"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth={2}
                  d="M6 18L18 6M6 6l12 12"
                />
              </svg>
            </button>
            <ul className="mt-4">
              <li>
                <Link
                  href="/products"
                  className="text-white block py-2 px-4 hover:bg-gray-800"
                >
                  Products
                </Link>
              </li>
              <li>
                <Link
                  href="/company"
                  className="text-white block py-2 px-4 hover:bg-gray-800"
                >
                  Company
                </Link>
              </li>
              <li>
                <Link
                  href="/contact"
                  className="text-white block py-2 px-4 hover:bg-gray-800"
                >
                  Contact
                </Link>
              </li>
            </ul>
          </div>
        </div>
      )}
    </div>
  );
};

export default Header;
