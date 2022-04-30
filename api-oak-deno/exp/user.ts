// users.js
import sql from './db.ts';

export async function getUsersOver(create_date: number) {
  const users = await sql`
    select
      *
    from sys_user
    where create_date > ${ create_date }
  `
  // users = Result [{ name: "Walter", age: 80 }, { name: 'Murray', age: 68 }, ...]
  return users
}



export async function getUserByUnsafeApi(...args: Array<string | number >) {
  const users = await sql.unsafe(" select real_name from sys_user where create_date > $1 and delete_enum = $2", args,{ prepare: true })
  return users
}



// async function insertUser({ name, age }) {
//   const users = await sql`
//     insert into users
//       (name, age)
//     values
//       (${ name }, ${ age })
//     returning name, age
//   `
//   // users = Result [{ name: "Murray", age: 68 }]
//   return users
// }