# Interview Guide: Rails developer roles (Pakistan)

How software companies in Pakistan usually hire Rails developers with 0–3 years of experience, and how to prepare for each step. For the questions themselves, see **[questions.md](questions.md)**.

## The usual process

Small companies may do all of this in one or two calls. Larger companies usually run every step.

| Step | What happens | How to prepare |
|---|---|---|
| **1. HR screening** (phone or video) | About you, why you're switching, **current and expected salary**, **notice period**, availability | Have a salary range ready (see below), know your notice period, and keep your intro short |
| **2. Online test** (HackerRank, Codility, TestGorilla or the company's own) | MCQs on OOP, SQL, Ruby/Rails and logic, plus 1–3 coding problems; usually timed (45–90 min) | Practise problems from [problem-solving](../problem-solving/) under a timer; revise SQL joins and GROUP BY |
| **3. Technical interview** (1–2 rounds) | Ruby and Rails concepts, SQL, OOP, your past projects, sometimes live coding or writing a query | [questions.md](questions.md); explain your projects in depth |
| **4. Take-home assignment** (common at service companies) | Build a small Rails app or API in 2–5 days, such as a todo or blog with auth, a booking API, or a CSV importer | See the take-home checklist below |
| **5. Review / pairing call** | Walk through your assignment, explain your decisions, extend it live | Know every line of what you submitted |
| **6. Final round** (team lead, CTO or manager) | Culture fit, communication, sometimes system design for mid level | Behavioural answers; questions for them |
| **7. Offer** | Salary, designation (Associate / Software Engineer / Senior), probation (often 3 months) | Negotiate before you accept |

### Things specific to the Pakistan market
- **Many companies work with US, UK or Middle East clients**, so **spoken English** is assessed throughout. You may end up talking to clients directly. Practise explaining technical work clearly and simply.
- **Your level is often decided by the interview**, not by your years of experience. One interview can lead to an Associate SE, SE or Senior SE offer. Answering the **(mid)** topics well is what moves you up a band.
- **Expect SQL and OOP basics in every round**, even for a Rails role. Companies here lean on them heavily as a filter.
- **Rails shops are mostly product startups and service companies** with foreign clients. Interviewers like to see that you've maintained or upgraded existing code bases, not just started new projects.
- **Shift timings:** many roles work US hours (evening or night shift). Ask about timings and whether there's a shift allowance, transport or dinner.
- **Benefits to ask about:** medical (OPD and IPD, family coverage), provident fund, annual increments, bonuses, leave policy, remote or hybrid work, laptop, and whether part of the salary is paid in USD.

## Salary and level

- Look up current ranges for **your city and experience** on Glassdoor, LinkedIn, local developer Facebook groups, and by asking friends at similar companies. Pay varies widely between local-market companies and those with foreign clients.
- When asked for your **expected salary**, give a **range** whose bottom is a number you'd still be happy with. Justify it with your skills, not your needs.
- If they say "we'll decide the level after the interview", ask about the **band for each level** at the end of the process.
- Get the **gross vs net (after tax)** figure, the probation salary, and the **increment cycle** in writing.

## If you've been away from Rails for a while

Interviewers will ask about it. Be honest and talk about what you've done since:
> "For the past year I've been working mostly on X, which taught me Y. I've kept up with Rails: I've set up a Rails 8 project to try Solid Queue, the new authentication generator and `params.expect`, and refreshed my Ruby with the 3.4 features."

Then make that true: build something small in [`../rails`](../rails/) with the current Rails version and mention it.

## Your project story

Have **one project** you can go deep on. Interviewers in Pakistan spend a lot of time on past projects. For that project, be ready to answer:
1. What it does and who uses it, in two sentences.
2. The architecture: models and their associations, background jobs, third-party APIs, deployment.
3. Your part in it specifically.
4. The hardest bug or performance problem, and how you found and fixed it.
5. What you'd do differently now.

## Take-home assignment checklist

Many candidates submit something that just works. These things make yours stand out:
- [ ] A clear **README**: setup steps, how to run the tests, assumptions, what you'd improve with more time
- [ ] Small commits with meaningful messages (they will look at the git log)
- [ ] Validations, database constraints and indexes on foreign keys
- [ ] No N+1 queries (use `includes`), and pagination on lists
- [ ] Strong params, authentication where it's needed, no secrets committed
- [ ] **Tests** for models and request specs for the main endpoints
- [ ] Consistent JSON error responses (for an API)
- [ ] RuboCop clean; seeds so they can try it straight away
- [ ] Optional: a Dockerfile, a CI workflow, a deployed demo link

## On the day
- Test your camera, mic and internet beforehand, and have a backup (mobile hotspot).
- Keep an editor and an `irb` / `rails console` ready in case they ask you to share your screen.
- **Think aloud** when solving problems. Interviewers care about how you approach them more than whether you finish.
- If you don't know something, say so, then explain how you'd find out or reason toward an answer.
- Ask a few good questions at the end (see [questions.md](questions.md#questions-to-ask-them)).
