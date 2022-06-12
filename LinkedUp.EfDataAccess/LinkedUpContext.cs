using LinkedUp.Domain;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinkedUp.EfDataAccess
{
    public class LinkedUpContext : DbContext
    {
        public LinkedUpContext(DbContextOptions options = null) : base(options)
        {

        }
        public IApplicationUser User { get; }

        /*protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Data Source=DESKTOP-AUKHI58;Initial Catalog=ASP-LinkedUp;Integrated Security=True").UseLazyLoadingProxies();
        }*/
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfigurationsFromAssembly(this.GetType().Assembly);

            base.OnModelCreating(modelBuilder);
        }
        public override int SaveChanges()
        {
            foreach (var entry in this.ChangeTracker.Entries())
            {
                if (entry.Entity is Entity e)
                {
                    switch (entry.State)
                    {
                        case EntityState.Added:
                            e.IsActive = true;
                            e.CreatedAt = DateTime.UtcNow;
                            break;
                        case EntityState.Modified:
                            e.UpdatedAt = DateTime.UtcNow;
                            e.UpdatedBy = User?.Identity;
                            break;
                        case EntityState.Deleted:
                            e.DeletedAt = DateTime.UtcNow;
                            e.DeletedBy = User?.Identity;
                            break;
                    }
                }
            }

            return base.SaveChanges();
        }

        public DbSet<User> Users { get; set; }
        public DbSet<Post> Posts { get; set; }
        public DbSet<PostIntercation> Intercations { get; set; }
        public DbSet<Notification> Notifications { get; set; }
        public DbSet<Connection> Connections { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Topic> Topics { get; set; }
        public DbSet<PostTopic> PostTopics { get; set; }
        public DbSet<UserInterest> UserInterests { get; set; }
        public DbSet<CategoryTopic> CategoryTopics { get; set; }
        public DbSet<UserUseCase> UserUseCases { get; set; }
        public DbSet<Media> Media { get; set; }
        public DbSet<PostMedia> PostMedia { get; set; }
        public DbSet<UseCaseLog> UseCaseLogs { get; set; }
        public DbSet<ExceptionLog> ExceptionLogs { get; set; }
    }
}
