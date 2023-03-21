import { Middleware } from "@nuxt/types";

const authMiddleware: Middleware = async ({ store, redirect }) => {
  // const isAuthenticated = store.getters['auth/isAuthenticated']
  const isAuthenticated = false

  if (isAuthenticated) {
    console.log("User is authenticated.");
  } else {
    redirect('/welcome')
  }
}

export default authMiddleware
