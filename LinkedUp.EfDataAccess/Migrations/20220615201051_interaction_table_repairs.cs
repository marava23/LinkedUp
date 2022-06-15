using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace LinkedUp.EfDataAccess.Migrations
{
    public partial class interaction_table_repairs : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            

            migrationBuilder.AddColumn<DateTime>(
                name: "CreatedAt",
                table: "Intercations",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AddColumn<DateTime>(
                name: "DeletedAt",
                table: "Intercations",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "DeletedBy",
                table: "Intercations",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsActive",
                table: "Intercations",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<DateTime>(
                name: "UpdatedAt",
                table: "Intercations",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "UpdatedBy",
                table: "Intercations",
                type: "nvarchar(max)",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "CreatedAt",
                table: "Intercations");

            migrationBuilder.DropColumn(
                name: "DeletedAt",
                table: "Intercations");

            migrationBuilder.DropColumn(
                name: "DeletedBy",
                table: "Intercations");

            migrationBuilder.DropColumn(
                name: "IsActive",
                table: "Intercations");

            migrationBuilder.DropColumn(
                name: "UpdatedAt",
                table: "Intercations");

            migrationBuilder.DropColumn(
                name: "UpdatedBy",
                table: "Intercations");

          
        }
    }
}
