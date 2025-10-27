const express = require('express');
const app = express();
const PORT = 3000;

// Middleware для парсинга JSON
app.use(express.json());

// Простые данные в памяти
let users = [
  { id: 1, name: 'John Doe', email: 'john@example.com' },
  { id: 2, name: 'Jane Smith', email: 'jane@example.com' }
];

let tasks = [
  { 
    id: 1, 
    title: 'Learn Node.js', 
    description: 'Study the basics of Node.js and Express', 
    complete: false, 
    createdAt: Date.now(), 
    updatedAt: Date.now(),
    userId: 1 
  },
  { 
    id: 2, 
    title: 'Build REST API', 
    description: 'Create a simple REST API with Express', 
    complete: true, 
    createdAt: Date.now() - 86400000, 
    updatedAt: Date.now(),
    userId: 2 
  }
];

// GET /users - получить всех пользователей
app.get('/users', (req, res) => {
  res.json(users);
});

// GET /users/:id - получить пользователя по ID
app.get('/users/:id', (req, res) => {
  const user = users.find(u => u.id === parseInt(req.params.id));
  if (!user) return res.status(404).json({ error: 'User not found' });
  res.json(user);
});

// POST /users - создать нового пользователя
app.post('/users', (req, res) => {
  const newUser = {
    id: users.length + 1,
    name: req.body.name,
    email: req.body.email
  };
  users.push(newUser);
  res.status(201).json(newUser);
});

// GET /tasks - получить все задачи
app.get('/tasks', (req, res) => {
  res.json(tasks);
});

// GET /tasks/:id - получить задачу по ID
app.get('/tasks/:id', (req, res) => {
  const task = tasks.find(t => t.id === parseInt(req.params.id));
  if (!task) return res.status(404).json({ error: 'Task not found' });
  res.json(task);
});

// POST /tasks - создать новую задачу
app.post('/tasks', (req, res) => {
  const timestamp = Date.now();
  const newTask = {
    id: tasks.length + 1,
    title: req.body.title,
    description: req.body.description,
    complete: req.body.complete || false,
    createdAt: timestamp,
    updatedAt: timestamp,
    userId: req.body.userId
  };
  tasks.push(newTask);
  res.status(201).json(newTask);
});

// PUT /tasks/:id - обновить задачу
app.put('/tasks/:id', (req, res) => {
  const taskIndex = tasks.findIndex(t => t.id === parseInt(req.params.id));
  if (taskIndex === -1) return res.status(404).json({ error: 'Task not found' });

  const updatedTask = {
    ...tasks[taskIndex],
    ...req.body,
    id: tasks[taskIndex].id, // Не позволяем менять ID
    createdAt: tasks[taskIndex].createdAt, // Не позволяем менять дату создания
    updatedAt: Date.now() // Всегда обновляем updatedAt
  };

  tasks[taskIndex] = updatedTask;
  res.json(updatedTask);
});

// DELETE /tasks/:id - удалить задачу
app.delete('/tasks/:id', (req, res) => {
  const taskIndex = tasks.findIndex(t => t.id === parseInt(req.params.id));
  if (taskIndex === -1) return res.status(404).json({ error: 'Task not found' });

  const deletedTask = tasks.splice(taskIndex, 1)[0];
  res.json({ message: 'Task deleted', task: deletedTask });
});

// GET /tasks/user/:userId - получить задачи конкретного пользователя
app.get('/tasks/user/:userId', (req, res) => {
  const userTasks = tasks.filter(t => t.userId === parseInt(req.params.userId));
  res.json(userTasks);
});

// Запуск сервера
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});