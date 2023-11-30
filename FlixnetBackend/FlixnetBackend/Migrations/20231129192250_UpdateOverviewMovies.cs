using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace FlixnetBackend.Migrations
{
    /// <inheritdoc />
    public partial class UpdateOverviewMovies : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Description",
                table: "Movies",
                newName: "Overview");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Description",
                table: "Movies",
                newName: "Overview");
        }
    }
}
