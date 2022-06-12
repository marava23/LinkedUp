using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace LinkedUp.EfDataAccess.Migrations
{
    public partial class added_use_case_logger : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "UseCaseLogs",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UseCaseName = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    User = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    UserId = table.Column<int>(type: "int", nullable: false),
                    ExecutionDateTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Data = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Duration = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UseCaseLogs", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_UseCaseLogs_User",
                table: "UseCaseLogs",
                column: "User");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "UseCaseLogs");
        }
    }
}
